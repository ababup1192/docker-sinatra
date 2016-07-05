require 'dm-core'
require 'dm-migrations'
# Model Classes
require_relative 'src/word'

task 'db:migrate' do
  DataMapper::Logger.new($stdout, :debug)
  # DataMapper.setup(:default, 'postgres://postgres:@db/myapp')
  DataMapper.setup(:default, 'postgres://postgres:@db')
  DataMapper.auto_upgrade!
  self
end
