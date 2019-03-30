require 'bundler'

Bundler.require

set :database, {adapter: "sqlite3", database: "chats.sqlite3"}

class Chat < ActiveRecord::Base
  validates_presence_of :text
end

#reverseメソッドはruby側の処理になるのd、えactive record側でやったほうがいい

get '/' do
  # @chats = Chat.all.order.reverse[0...30]
  # @chats = Chat.all.reverse_order.limit(30)
  @chats = Chat.all.last(30)
  erb :index
end

post '/' do
  @chat = Chat.new(text: params[:message])
  if @chat.save
    puts "成功！"
    redirect '/'
  else
    puts "失敗"
    redirect '/'
  end
end