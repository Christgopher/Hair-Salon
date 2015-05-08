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

  describe("#update") do
    it("lets you update a clients name") do
      client = Client.new({name: "George", id: nil, stylist_id: 1})
      client.save()
      client.update("James")
      expect(client.name()).to(eq("James"))
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
