class ProcessWebsite

  require 'asciiart'
  require 'imgkit'

  def initialize(url: nil, image_num: 1)
    @image_num = image_num

    # Either use the website given or get a website
    url.present? ? download_image(url) : download_image(chose_website)
    # Take webpage and get the equivalent ascii values
    convert_ascii
  end

  def chose_website
    chosen_website = nil

    # Go the website file and find a random website
    File.foreach("lib/fann/wc2fann/data/website_list.txt").each_with_index do |line, number|
      chosen_website = line if rand < 1.0/(number+1)
    end
    return chosen_website.squish
  end

  def download_image(url)
    # kit = IMGKit.new(url, :quality => 50, :width => side_size, :height => side_size,
    # "crop-w" => crop_side_size, "crop-h" => crop_side_size, "disable-smart-width" => true, "zoom" => 0.2)

    url = "http://www." + url

    while !valid?(url)
      url = "http://www." + chose_website
    end

    kit = IMGKit.new(url, quality: 30, "crop-w" => 1280, "crop-h" => 720)
    @image_file = "./lib/fann/wc2fann/data/screenshot_#{@image_num}.png"
    kit.to_file(@image_file)

    # Ensure a image was retrieved and saved properly
    while File.zero?(@image_file)
      download_image(chose_website)
    end
  end

  def convert_ascii
    ascii_file = "./lib/fann/wc2fann/data/ascii_#{@image_num}.txt"
    system "asciiart -c -w 20 #{@image_file} > #{ascii_file}"

    while File.zero?(ascii_file)
      download_image(chose_website)
      convert_ascii
    end
  end

  def valid?(url)
    # Determine validity of the url
    response = RestClient.get url
    # Code 200 indicates no errors accessing a webpage
    return false if response.nil?
    return response.code == 200 ? true : false
  rescue # There was an error, the url is probably not valid
    return false
  end

end
