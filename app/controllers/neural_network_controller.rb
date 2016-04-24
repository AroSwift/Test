class NeuralNetworkController < ApplicationController

  def index
  end

  def compare_websites
  end

  def compare_websites_update
    # Process the websites
    ProcessWebsite.new(url: params[:compare_websites][:web_page_link_1], image_num: 1)
    ProcessWebsite.new(url: params[:compare_websites][:web_page_link_2], image_num: 2)

    # Call C++ file to
    system "lib/fann/wc2fann/webComp"

    respond_to do |format|
      format.html { redirect_to neural_network_show_websites_path }
    end
  end

  def show_websites
    # Read the output of the file
    file = File.open("./lib/fann/wc2fann/data/Web_Comp_Answer.txt", "r+")
    file_output = file.read
    file_output.squish
    file.close

    # Image 1 is better
    if file_output.strip == '0'
      @image_1 = "correct"
      @image_2 = "incorrect"
    # Image 2 is better
  elsif file_output.strip == '1'
      @image_1 = "incorrect"
      @image_2 = "correct"
    else # Something went wrong so both are bad
      @image_1 = "incorrect"
      @image_2 = "incorrect"
    end
  end

  def train
    # Get two new images
    ProcessWebsite.new(image_num: 1)
    ProcessWebsite.new(image_num: 2)
  end

  def train_update
    # Call neural network with true indicating that we want to train
    system "lib/fann/wc2fann/web_comp_train #{params[:best_image]}"

    respond_to do |format|
      format.html { redirect_to neural_network_train_path }
    end
  end

end
