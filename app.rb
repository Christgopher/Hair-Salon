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

post('/clients') do
  name = params.fetch('client_name')
  client = Client.new({name: name, id: nil, stylist_id: 0}).save()
  @stylists = Stylist.all()
  @clients = Client.all()
  erb(:index)
end

get('/client/:id') do
  @client = Client.find(params.fetch("id")).to_i()
end
