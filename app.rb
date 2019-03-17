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


#シェルの中で使えるへんす
#ここにコマンドがあるということをPCに教えてあげるのが「パスを通す」ということ


post '/create_chat' do
  @chat = Chat.new(text: params[:text])
  if @chat.save
    redirect '/'
  else
    puts "失敗"
    redirect '/'
  end
end