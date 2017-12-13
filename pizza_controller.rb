require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/pizza.rb')

#This is our INDEX route.
get('/pizzas') do
  @pizzas = Pizza.all()
  erb(:index)
end

#NEW - getting a new order from customer
get('/pizzas/new') do
  erb(:new)
end

#SHOW
get('/pizzas/:id') do
  id = params[:id]
  @pizza = Pizza.find(id)
  erb(:show)
end

#CREATE
post('/pizzas') do
  @pizza = Pizza.new(params)
  @pizza.save()
  params.to_s()
  erb(:create)
end


#DELETE
post('/pizzas/:id/delete') do
  pizza = Pizza.find(params[:id])
  pizza.delete()
  redirect'/pizzas'
  # erb(:index)
end

##EDIT
get('/pizzas/:id/edit') do
@pizza = Pizza.find(params[:id])
erb(:edit)
end

post('/pizzas/:id') do
@pizza = Pizza.new(params)
@pizza.update()
redirect'/pizzas'
end
