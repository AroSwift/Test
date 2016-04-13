class ProcessWebsite

  require 'asciiart'
  require 'imgkit'

  def initialize(url, image_num)
    @image_num = image_num
    download_image(url)
    convert_ascii
  end

  def download_image(url)
    kit = IMGKit.new(url)
    @file = "./lib/screenshot_#{@image_num}.png"
    kit.to_file(@file)
  end

  def enforce_size

  end

  def convert_ascii
    # sleep 3
    system "asciiart -c -w 50 #{@file} > ./lib/ascii_#{@image_num}.txt"
  end

end