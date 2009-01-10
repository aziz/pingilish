require 'net/http'
require 'uri'

class Farsi < String
  
  TO_FARSI_SERVICE_URL = "http://www.behjoo.com/php/convert.php"
  TO_FARSI_QUERY_STRING = 'farsi'

  def initialize(text)
    @text = text
  end
  
  def to_farsi
    Net::HTTP.post_form(URI.parse(TO_FARSI_SERVICE_URL), {TO_FARSI_QUERY_STRING => @text.downcase }).body
    # TODO: save the files in yaml
    # TODO: verify that it's persian
  end  

end

