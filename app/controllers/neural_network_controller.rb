class NeuralNetworkController < ApplicationController

  def index
  end

  def compare_websites
  end

  def compare_websites_update
    # Call the neural network
    system "lib/a.out true"

    params[:compare_websites][:web_page_link_1]
    params[:compare_websites][:web_page_link_2]

    sleep 0.3 # Wait to ensure c++ neural network updates output

    file = File.open("lib/output.txt", "r+")
    file_output = file.read
    file.close

    respond_to do |format|
      format.html { redirect_to neural_network_compare_websites_path(:output => file_output) }
    end
  end

  def train
    # Call neural network with true indicating that we want to train
    system "lib/a.out"

    file = File.open("lib/output.txt", "r+")
    @result = file.read
    file.close

    file = File.open("lib...") do |f|
      f.read
    end

  end

  def train_update
    respond_to do |format|
      format.html { redirect_to action: :train_update }
    end
  end

end
