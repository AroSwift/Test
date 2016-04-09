class NeuralNetworkController < ApplicationController

  def index
  end

  def compare_websites
    # Call the neural network
    system "lib/a.out {params[:web_page_link_1]} {params[:web_page_link_2]}"

    # Wait to ensure c++ neural network updates output
    sleep 0.5

    file = File.open("lib/output.txt", "r+")
    @result = file.read
    file.close
  end

  def train
    file = File.open("lib/output.txt", "r+")
    @result = file.read
    file.close


  end

end
