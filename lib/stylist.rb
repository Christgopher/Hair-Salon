class Stylist
  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id= attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_stylists = DB.exec("SELECT * FROM stylists")
    stylists = []

    returned_stylists.each() do |stylist|
      name = stylist.fetch("name")
      id = stylist.fetch("id").to_i()
      stylists.push(Stylist.new({name: name, id: id}))
    end

    stylists
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |other|
    self.name() == (other.name()) && self.id() == (other.id())
  end

  define_method(:clients) do
    returned_clients = DB.exec("SELECT * FROM clients WHERE stylist_id = #{self.id};")
    all_clients = []

    returned_clients.each() do |client|
      name = client.fetch("name")
      id = client.fetch("id").to_i()
      stylist_id = client.fetch("stylist_id").to_i()
      all_clients.push(Client.new({name: name, id:  id, stylist_id: stylist_id}))
    end

    all_clients
  end
end
