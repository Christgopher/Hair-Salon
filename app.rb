require("sinatra")
require("sinatra/reloader")
require("./lib/client")
require("./lib/stylist")
also_reload("lib/**/*.rb")
require("pg")

DB = PG.connect({:dbname => "hair_salon"})


get('/') do
  @stylists = Stylist.all()
  @clients = Client.all()
  erb(:index)
end

post('/stylists') do
  name = params.fetch('stylist_name')
  stylist = Stylist.new({name: name, id: nil}).save()
  @stylists = Stylist.all()
  @clients = Client.all()
  erb(:index)
end

get('/stylist/:id') do
  @stylist = Stylist.find(params.fetch("id").to_i())
  @clients = Client.all()
  erb(:stylist)
end

patch('/stylist/:id') do
  stylist_id = params.fetch("id").to_i()
  @stylist = Stylist.find(stylist_id)
  client_id = params.fetch("client_id").to_i()
  @client = Client.find(client_id)
  @client.update({stylist_id: stylist_id})
  @clients = Client.all()
  erb(:stylist)
end

patch('/stylist_edit/:id') do
  stylist_id = params.fetch("id").to_i()
  @stylist = Stylist.find(stylist_id)
  name = params.fetch("name")
  @stylist.update(name)
  @clients = Client.all()
  erb(:stylist)
end

delete('/stylist_delete/:id') do
  @stylist = Stylist.find(params.fetch("id").to_i)
  @stylist.delete()
  @stylists = Stylist.all()
  @clients = Client.all()
  erb(:index)
end

post('/clients') do
  name = params.fetch('client_name')
  client = Client.new({name: name, id: nil, stylist_id: 0}).save()
  @stylists = Stylist.all()
  @clients = Client.all()
  erb(:index)
end

get('/client/:id') do
  @client = Client.find(params.fetch("id").to_i())
  erb(:client)
end

patch('/client_edit/:id') do
  client_id = params.fetch("id").to_i()
  @client = Client.find(client_id)
  name = params.fetch("name")
  @client.update(name)
  erb(:client)
end

delete('/client_delete/:id') do
  @client = Client.find(params.fetch("id").to_i)
  @client.delete()
  @stylists = Stylist.all()
  @clients = Client.all()
  erb(:index)
end
