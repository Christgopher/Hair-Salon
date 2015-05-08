require "spec_helper"

describe(Client) do
  describe(".all") do
    it("starts off empty") do
      expect(Client.all()).to(eq([]))
    end
  end

  describe("#name") do
    it("tells you a client's name") do
      client = Client.new({name: "George", id: nil, stylist_id: 1})
      expect(client.name()).to(eq("George"))
    end
  end

  describe("#id") do
    it("tells you the id of a client") do
      client = Client.new({name: "George", id: nil, stylist_id: 1})
      client.save()
      expect(client.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#==") do
    it("rewrites the equals method") do
      client = Client.new({name: "George", id: nil, stylist_id: 1})
      client2 = Client.new({name: "George", id: nil, stylist_id: 1})
      expect(client).to(eq(client2))
    end
  end

  describe("#save") do
    it("lets you save a client to the database") do
      client = Client.new({name: "George", id: nil, stylist_id: 1})
      client.save()
      expect(Client.all()).to(eq([client]))
    end
  end

  describe(".find") do
    it("returns a client by its id") do
      client = Client.new({name: "George", id: nil, stylist_id: 1})
      client.save()
      stylist2 = Client.new({name: "James", id: nil, stylist_id: 1})
      stylist2.save()
      expect(Client.find(client.id())).to(eq(client))
    end
  end

  describe("#update") do
    it("lets you update a clients name") do
      client = Client.new({name: "George", id: nil, stylist_id: 1})
      client.save()
      client.update({name: "James"})
      expect(client.name()).to(eq("James"))
    end

    it("lets you update a clients stylist_id") do
      client = Client.new({name: "George", id: nil, stylist_id: 1})
      client.save()
      client.update({stylist_id: 2})
      expect(client.stylist_id()).to(eq(2))
    end
  end

  describe("#delete") do
    it("lets you delete a client") do
      client = Client.new({name: "George", id: nil, stylist_id: 1})
      client.save()
      client.delete()
      expect(Client.all()).to(eq([]))
    end
  end
end
