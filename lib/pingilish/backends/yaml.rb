require 'yaml'
require 'rubygems'
require 'ya2yaml'

class YamlBackend < BackendManager

  DB_FILE_PATH = File.join(File.dirname(__FILE__), '../../../db/pingilish_words.yml')

  def initialize
    @db = YAML.load_file(DB_FILE_PATH)
  end
  
  def load
    @db
  end

  def update(word_list)
    # opening yaml file. reading all items and appending new items 
    filename = DB_FILE_PATH
    db = @db
    # TODO: check is it exist and the value is diffrenent then convert it to a hash
    db.merge!(word_list) if word_list.is_a?(Hash)
    
    begin
      # lock file and write to it
      if( File.exists? filename )
        file = File.new( filename, "r+")
      else
        file = File.new( filename, "w+" )
      end
      file.flock( File::LOCK_EX )
      file.truncate( 0 )
      file.rewind
      file.write( db.ya2yaml )
    ensure
      # unlock and close file
      file.flock( File::LOCK_UN )
      file.close
    end
  end  
  
  def stats
    
  end

end
