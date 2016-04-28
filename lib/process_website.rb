class ProcessWebsite

  require 'asciiart'
  require 'imgkit'

  def initialize(url: nil, image_num: 1)
    @image_num = image_num
    @get_website = 0
    @download_image = 0
    @convert_to_ascii = 0
    @url_validity = 0

    # Either use the website given or get a website
    url.present? ? download_image(url) : download_image(chose_website)
    # Take webpage and get the equivalent ascii values
    convert_ascii
  end

  def chose_website
    chosen_website = nil

    if @get_website == 0
      @get_website = 1
      system "say retrieving website #{@image_num}"
    end

    # Go the website file and find a random website
    File.foreach("lib/fann/wc2fann/data/website_list.txt").each_with_index do |line, number|
      chosen_website = line if rand < 1.0/(number+1)
    end
    return chosen_website.squish
  end

  def download_image(url)
    # kit = IMGKit.new(url, :quality => 50, :width => side_size, :height => side_size,
    # "crop-w" => crop_side_size, "crop-h" => crop_side_size, "disable-smart-width" => true, "zoom" => 0.2)

    # Get a valid url
    url = "http://www." + url
    while !valid?(url)
      url = "http://www." + chose_website
    end

    if @download_image == 0
      @download_image = 1
      system "say processing snapshot of website #{@image_num}"
    end

    # Take a snapshot of that website by grabbing the html, css, and javascript
    # and do a compilation the source in nokogiri in order to get an image
    kit = IMGKit.new(url, quality: 30, "crop-w" => 1280, "crop-h" => 720)
    @image_file = "./lib/fann/wc2fann/data/screenshot_#{@image_num}.png"
    kit.to_file(@image_file) # Save that image

    # Ensure the image was retrieved and saved properly
    while File.zero?(@image_file)
      download_image(chose_website)
    end
  end

  def convert_ascii
    if @convert_to_ascii == 0
      @convert_to_ascii = 1
      system "say converting website to ascii #{@image_num}"
    end

    # Conver the image into ascii via kernal
    @ascii_file = "./lib/fann/wc2fann/data/ascii_#{@image_num}.txt"
    system "asciiart -c -w 20 #{@image_file} > #{@ascii_file}"

    # Ensure that the ascii returns 9 lines
    while File.open(@ascii_file) { |f| f.count } != 9
      # Redo the whole process until a valid ascii file is recieved
      download_image(chose_website)
      convert_ascii
    end
  end

  def valid?(url)
    if @url_validity == 0
      @url_validity = 1
      system "say determining validity of url #{@image_num}"
    end

    # Determine validity of the url
    response = RestClient.get url
    # Code 200 indicates no errors accessing a webpage
    return false if response.nil?
    return response.code == 200 ? true : false
  rescue # There was an error, the url is probably not valid
    return false
  end

end
