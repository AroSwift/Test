class ProcessWebsite

  require 'asciiart'
  require 'imgkit'

  def initialize(url, image_num)
    @image_num = image_num
    @file = download_image(url)
    convert_ascii
  end

  def download_image(url)
    kit = IMGKit.new(url)
    file = "./lib/screenshot_#{@image_num}.png"
    kit.to_file(file)
    return file
  end

  def convert_ascii
    system "asciiart -c #{@file} > ./lib/ascii_#{@image_num}.txt"
  end

end