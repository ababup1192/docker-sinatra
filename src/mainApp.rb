# coding: utf-8
require 'sinatra/base'
require 'sinatra/reloader'
require 'data_mapper'
require_relative 'word'

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, 'postgres://postgres:@db')

# Sinatra Main controller
class MainApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  get '/words' do
    words = Word.all.map do |w|
      w.id.to_s + ": #{w.msg}"
    end
    words.join(',  ')
  end
  get '/words/:id' do
    id = params[:id]
    word = Word.get(id)
    if word.nil?
      "Record of id: #{id} is not found."
    else
      word.id.to_s + ": #{word.msg}"
    end
  end
  post '/words' do
    word = Word.create(msg: request.body.gets)
    word.id.to_s
  end
  put '/words/:id' do
    id = params[:id]
    word = Word.get(id)
    if word.nil?
      'false'
    else
      word.update(msg: request.body.gets)
      'true'
    end
  end
  delete '/words/:id' do
    id = params[:id]
    word = Word.get(id)
    if word.nil?
      'false'
    else
      word.destroy.to_s
    end
  end
end
