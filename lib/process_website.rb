class ProcessWebsite

  require 'asciiart'
  require 'imgkit'

  def initialize(url: nil, image_num: 1)
    @image_num = image_num
    url.present? ? download_image(url) : download_image(chose_website)
    convert_ascii
  end

  def chose_website
    chosen_website = nil
    File.foreach("lib/website_list.txt").each_with_index do |line, number|
      chosen_website = line if rand < 1.0/(number+1)
    end
    return "http://www." + chosen_website.squish
  end

  def download_image(url)

    # kit = IMGKit.new(url, :quality => 50, :width => side_size, :height => side_size, "crop-w" => crop_side_size, "crop-h" => crop_side_size, "disable-smart-width" => true, "zoom" => 0.2)

    kit = IMGKit.new(url, quality: 50, "crop-w" => 1000, "crop-h" => 700)
    @file = "./lib/screenshot_#{@image_num}.png"
    kit.to_file(@file)
  end

  def convert_ascii
    system "asciiart -c -w 50 #{@file} > ./lib/ascii_#{@image_num}.txt"
  end

end