class Tokenizer

  def initialize(text)
    @text = text    
  end
  
  def tokens
    @text.split(' ')
  end
  
end