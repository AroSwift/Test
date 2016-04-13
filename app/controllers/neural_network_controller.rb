class NeuralNetworkController < ApplicationController

  def index
  end

  def compare_websites
  end

  def compare_websites_update
    # Process the websites
    ProcessWebsite.new(url: params[:compare_websites][:web_page_link_1], image_num: 1)
    ProcessWebsite.new(url: params[:compare_websites][:web_page_link_2], image_num: 2)

    # Call the neural network
    system "lib/a.out"

    respond_to do |format|
      format.html { redirect_to neural_network_show_websites_path }
    end
  end

  def show_websites
    # Read the output of the file
    file = File.open("lib/output.txt", "r+")
    file_output = file.read
    file_output.squish
    file.close

    if file_output == 1
      @image_1 = "correct"
      @image_2 = "incorrect"
    elsif file_output == 2
      @image_1 = "incorrect"
      @image_2 = "correct"
    else
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
    system "lib/a.out {params[:best_image]}"

    respond_to do |format|
      format.html { redirect_to neural_network_train_path }
    end
  end

end
