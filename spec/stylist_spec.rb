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
end
