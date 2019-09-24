require 'bundler'

Bundler.require

set :database, {adapter: "sqlite3", database: "chats.sqlite3"}

class Chat < ActiveRecord::Base
  validates_presence_of :text
end

class Server < Sinatra::Base
  enable :sessions
end

get '/' do
  if session[:id] == nil
    erb :login
  else
    erb :mkroom
  end
end

get '/:room' do
  @chats = Chat.where(room: params[:room]).last(30)
  erb :room
end

post '/:room' do
  @chat = Chat.new(room: params[:room],text: params[:message])
  if @chat.save
    puts "成功！"
    status 200
  else
    puts "失敗"
    status 500
  end
end