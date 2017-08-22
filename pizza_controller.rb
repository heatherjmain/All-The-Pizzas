require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( './models/pizza' )


#1. READ
# INDEX route
get "/pizzas" do
  @pizzas = Pizza.all()
  erb(:index)
end
#controller instructions should generally be this small and concise


#this one has to go before SHOW as show requests :id which can be anything.  The more specific pizzas/new must be run before pizzas/:id
#3. CREATE
#NEW route
get "/pizzas/new" do
  erb(:new)
end

get "/home" do
  erb(:home)
end


#2. READ
#SHOW route
get "/pizzas/:id" do
  @pizza = Pizza.find(params[:id])
  erb(:show)
end


#4. CREATE
#CREATE route
post "/pizzas" do
  @pizza = Pizza.new( params )
  @pizza.save()
  erb(:create)
end


#5. DELETE
#DESTROY route
post "/pizzas/:id/delete" do
  @pizza = Pizza.find(params[:id])
  @pizza.delete()
  redirect to "/pizzas"
  # erb(:destroy)
end


#6. UPDATE
#EDIT route
get "/pizzas/:id/edit" do
  @pizza = Pizza.find(params[:id])
  erb(:edit)
end


#7. UPDATE
#UPDATE route
post "/pizzas/:id" do
  @pizza = Pizza.new(params)
  @pizza.update()
  redirect to "/pizzas/#{@pizza.id}"
  # erb(:update)
end
