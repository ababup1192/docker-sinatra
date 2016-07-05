require 'data_mapper'

# Model Class
class Word
  include DataMapper::Resource

  property :id,  Serial
  property :msg,  String
end

DataMapper.finalize
