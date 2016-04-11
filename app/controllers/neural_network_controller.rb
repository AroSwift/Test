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

    # image_1 = Screencap::Fetcher.new(params[:compare_websites][:web_page_link_1])
    # image_2 = Screencap::Fetcher.new(params[:compare_websites][:web_page_link_2])


    # # Setup Capybara
    # ws = Webshot::Screenshot.instance

    # # Capture Google's home page
    # ws.capture "http://www.wechitchat.com/", "wechitchat.png"

    # # Customize thumbnail
    # ws.capture "http://www.wechitchat.com/", "wechitchat.png", width: 100, height: 90, quality: 85

    # # Specify only width, height will be computed according to page's height
    # ws.capture "http://www.wechitchat.com/", "wechitchat.png", width: 1024

    # # Specify an array of additional HTTP status codes to accept,
    # # beyond normal success codes like 200 or 302
    # ws.capture "http://www.wechitchat.com/foo", "wechitchat_404.png", allowed_status_codes: [404]

    # # Customize thumbnail generation (MiniMagick)
    # # see: https://github.com/minimagick/minimagick
    # ws.capture("http://www.wechitchat.com/", "wechitchat.png") do |magick|
    #   magick.combine_options do |c|
    #     c.thumbnail "100x"
    #     c.background "white"
    #     c.extent "100x90"
    #     c.gravity "north"
    #     c.quality 85
    #   end
    # end

    a = AsciiArt.new(params[:compare_websites][:web_page_link_1])

    # system "webkit2png wechitchat.com"

    # image_1 = Screencap::Fetcher.new("http://wechitchat.com")
    # image_2 = Screencap::Fetcher.new("http://facebook.com")

    # image_1.fetch(
    #   output: './lib/image_1.jpg',
    #   # optional parameters:
    #   # div: '.header', # CSS selector
    #   width: 1024, # Width of Screenshot - Viewport
    #   height: 768 # Height of Screenshot - Viewport
    #   # top: 0, left: 0, width: 100, height: 100 # Area to capture screenshot of
    # )

    # image_2.fetch(
    #   output: './lib/image_2.jpg',
    #   # optional parameters:
    #   # div: '.header', # CSS selector
    #   width: 1024, # Width of Screenshot - Viewport
    #   height: 768 # Height of Screenshot - Viewport
    #   # top: 0, left: 0, width: 100, height: 100 # Area to capture screenshot of
    # )

    # sleep 0.3 # Wait to ensure c++ neural network updates output

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
