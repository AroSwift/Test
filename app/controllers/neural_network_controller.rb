class NeuralNetworkController < ApplicationController

  # require 'rest-client'
  # require 'screencap'
  # require 'phantomjs'
  require 'asciiart'

  def index
  end

  def compare_websites
  end

  def compare_websites_update
    # Call the neural network
    system "lib/a.out true"

    # Take a screenshot of the two webpages
    image_1 = IMGKit.new(params[:compare_websites][:web_page_link_1])
    image_2 = IMGKit.new(params[:compare_websites][:web_page_link_2])
    image_1.to_file("./lib/screenshot_1.png")
    image_2.to_file("./lib/screenshot_2.png")

    ascii_text_1 = AsciiArt.new("./lib/screenshot_1.png")
    File.open("./lib/ascii_1.txt", 'w') do |file|
      file.write(ascii_text_1.to_ascii_art)
    end

    ascii_text_2 = AsciiArt.new("./lib/screenshot_2.png")
    File.open("./lib/ascii_2.txt", 'w') do |file|
      file.write(ascii_text_2.to_ascii_art)
    end

    # Read
    file = File.open("lib/output.txt", "r+")
    file_output = file.read
    file.close

    respond_to do |format|
      format.html {
        redirect_to neural_network_compare_websites_path(:output => @file_output)
      }
    end
  end

  def train
    # Call neural network with true indicating that we want to train
    system "lib/a.out"

    # file = File.open("lib/output.txt", "r+")
    # @result = file.read
    # file.close

    # file = File.open("lib...") do |f|
    #   f.read
    # end

  end

  def train_update
    respond_to do |format|
      format.html { redirect_to action: :train_update }
    end
  end

end
