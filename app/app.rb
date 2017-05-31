require 'sinatra/base'
require_relative 'models/link'

class BookmarkManager < Sinatra::Base

get '/links' do
  @links = Link.all
  erb :'links/index'
end
end