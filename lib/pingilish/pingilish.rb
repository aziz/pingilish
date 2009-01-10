class Pingilish < String
  
  def initialize(text)
    @text = text
  end
  
  def to_pingilish
    db_filter = DbFilter.new(@text)
    text = db_filter.process
    
    # stem_filter = StemFilter.new(text)
    # text = stem_filter.process
    
    mapping_filter = MappingFilter.new(text)
    text = mapping_filter.process
  end
  
end