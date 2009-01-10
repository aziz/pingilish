class MappingFilter
  PERSIAN_CHARS = "۱۲۳۴۵۶۷۸۹۰،×؛ابپتثجحدذرزسصضطظفکگلمنك؟"
  ENGLISH_CHARS = "1234567890,*;abptsjhdzrzssztzfkglmnk?" 
  CHAR_MAP = [
  ['آ' , 'aa'],
  ['چ' , 'ch'],
  ['خ' , 'kh'],
  ['ژ' , 'zh'],
  ['ش' , 'sh'],
  ['ع' , "a'"],
  ['غ' , 'gh'],
  ['ق' , 'gh'],
  ['و' , 'o'],
  [' o ' , ' va '],
  [' o' , ' v'],
  ['هٔ' , 'eye'],
  ['ه' , '_H_'],
  ['_H_ ' , 'e '],
  ['_H_' , 'h'],
  ['ی' , 'i'],
  [' i' , ' y'],         # ?
  ['i ' , 'y '],         # ?
  ['َ' , 'a'],
  ['ِ' , 'e'],
  ['ُ' , 'o'],
  ['ً' , 'n'],
  ['ء' , "'"],
  ['‌' , '-']            # zwnj to - 
  ]
  
  def initialize(text) 
    @text = text
  end
  
  def process
    # general character replacement
    text = @text.to_s.tr(PERSIAN_CHARS,ENGLISH_CHARS)
    CHAR_MAP.each do |c_map|
      text = text.gsub(/#{c_map[0]}/,c_map[1])
    end    
    return text
    # TODO: make a mapping hash instead of this dirty gsub ing
    # TODO: replace non latin alphabet at the end
    # TODO: return an object with alternatives (like chert/chort)
    # TODO: seperate the login into classes: Tokenizer, StemmingFilter, DbFilter, GeneralMappingFilter
    # TODO: seperate the logic of dealing with a backend in a class, subclass it and write something for YML 
    # BUG: major bug, do not replace latin chars that came from DB by latin chars in mapping array! 
    # TODO: write the mapping filter interations
  end
    
end
