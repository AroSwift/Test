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

    # Read
    file = File.open("lib/output.txt", "r+")
    file_output = file.read
    file.close

    respond_to do |format|
      format.html {
        redirect_to neural_network_compare_websites_path(:output => file_output)
      }
    end
  end

  def show_websites
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
