class DbFilter

  def initialize(text) 
    @text = text.gsub(/ي/,"ی").gsub(/ك/,"ک") # dealing with non-standard characters
  end
  
  def process
    text = @text
    y_db = YamlBackend.new
    words = Tokenizer.new(@text)
    
    db = y_db.load
    words.tokens.each do |w|
      text = text.gsub(/#{w}/, db[w].to_s) if db[w]
    end
   
    return text
  # BUG: do not gsub just replace the text
  # BUG: case for hash and string
  end
  
end