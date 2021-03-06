require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'
require './models'

get '/' do
  @memos = Memo.all
  @categories = Category.all
  erb :index
end

# メモを新しく作成するときの処理
post '/new' do
  Memo.create([
    title: params[:title],
    body: params[:body],
    category_id: params[:category_id]
  ])
  puts params
  redirect '/'
end

# 特定のメモを編集するときの処理

# 特定のメモを更新するときの処理
get '/edit/:id' do
  @memo = Memo.find(params[:id])
  @categories = Category.all
  erb :edit
end

post '/edit/:id' do
  @memo = Memo.find(params[:id])
  @memo.update({
    title: params[:title],
    body: params[:body],
    category_id: params[:category_id]
  })
  redirect '/'
end

# 特定のメモを削除するときの処理
get '/delete/:id' do
  Memo.find(params[:id]).destroy
  redirect '/'
end

# メモをカテゴリ分類して表示するときの処理
