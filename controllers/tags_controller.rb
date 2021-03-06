require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/budget')
require_relative('../models/transaction')
require_relative('../models/tag')
require_relative('../models/merchant')


get '/tags' do
  @tags = Tag.all
  erb(:"tags/index")
end

get '/tags/new' do
  @tags = Tag.all
  erb(:"tags/new")
end

post '/tags' do
  Tag.new(params).save
  redirect to '/tags'
end

get '/tags/:id/edit' do
  @tag = Tag.find(params[:id])
  erb(:"tags/edit")
end

post '/tags/:id' do
  tag = Tag.new(params)
  tag.update
  redirect to "/tags"
end

post '/tags/:id/delete' do
  tags = Tag.find(params[:id])
  tags.delete
  redirect to '/tags'
end
