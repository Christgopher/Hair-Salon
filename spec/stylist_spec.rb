require "spec_helper"

describe(Stylist) do
  describe(".all") do
    it("starts off empty") do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe("#name") do
    it("tells you a stylist's name") do
      stylist = Stylist.new({name: "Rosey", id: nil})
      expect(stylist.name()).to(eq("Rosey"))
    end
  end

  describe("#id") do
    it("tells you the id of a stylist") do
      stylist = Stylist.new({name: "Rosey", id: nil})
      stylist.save()
      expect(stylist.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#==") do
    it("rewrites the equals method") do
      stylist1 = Stylist.new({name: "Rosey", id: nil})
      stylist2 = Stylist.new({name: "Rosey", id: nil})
      expect(stylist1).to(eq(stylist2))
    end
  end

  describe("#save") do
    it("lets you save a stylist to the database") do
      stylist = Stylist.new({name: "Rosey", id: nil})
      stylist.save()
      expect(Stylist.all()).to(eq([stylist]))
    end
  end

  describe("#clients") do
    it("shows all clients of a stylist") do
      stylist = Stylist.new({name: "Rosey", id: nil})
      stylist.save()
      client1 = Client.new({name: "Philip", id: nil, stylist_id: stylist.id()})
      client1.save()
      client2 = Client.new({name: "George", id: nil, stylist_id: stylist.id()})
      client2.save()
      expect(stylist.clients()).to(eq([client1, client2]))
    end
  end

  describe(".find") do
    it("returns a stylist by its id") do
      stylist = Stylist.new({name: "Rosey", id: nil})
      stylist.save()
      stylist2 = Stylist.new({name: "Jane", id: nil})
      stylist2.save()
      expect(Stylist.find(stylist.id())).to(eq(stylist))
    end
  end

  describe("#update") do
    it("lets you update a stylists name") do
      stylist = Stylist.new({name: "Rosey", id: nil})
      stylist.save()
      stylist.update("Jane")
      expect(stylist.name()).to(eq("Jane"))
    end
  end

  describe("#delete") do
    it("lets you delete a stylist") do
      stylist = Stylist.new({name: "Rosey", id: nil})
      stylist.save()
      stylist.delete()
      expect(Stylist.all()).to(eq([]))
    end
  end
end
