require "spec_helper"

describe(Client) do
  describe(".all") do
    it("starts off empty") do
      expect(Client.all()).to(eq([]))
    end
  end

  describe("#name") do
    it("tells you a stylist's name") do
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
end
