class NeuralNetworkController < ApplicationController

  def index
  end

  def compare_websites
  end

  def compare_websites_update
    # Call the neural network
    best_website = system "lib/a.out {params[:compare_websites][:web_page_link_1]} {params[:compare_websites][:web_page_link_2]}"

    # 1 = true and 2 = false
    best_website == true ? best_website = 1 : best_website = 2

    sleep 0.3 # Wait to ensure c++ neural network updates output

    file = File.open("lib/output.txt", "r+")
    @result = file.read
    file.close

    respond_to do |format|
      format.html { redirect_to action: :compare_websites, @result }
    end
  end

  def train
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
