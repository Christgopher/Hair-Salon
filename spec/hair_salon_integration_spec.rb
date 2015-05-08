require('capybara/rspec')
require('./app')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exception, false)
require 'pry'

describe('the listing stylists path', {:type => :feature}) do
  it("displays a list of stylists") do
    stylist = Stylist.new({name: "Rosey", id: nil})
    stylist.save()
    visit('/')
    expect(page).to have_content(stylist.name())
  end
end

describe('the adding stylists path', {:type => :feature}) do
  it("adds a stylist") do
    visit('/')
    fill_in('stylist_name', :with => "Rosey")
    click_button('Add Stylist')
    expect(page).to have_content("Rosey")
  end
end

describe('the listing clients path', {:type => :feature}) do
  it("displays a list of client") do
    client = Client.new({name: "James", id: nil, stylist_id: 0})
    client.save()
    visit('/')
    expect(page).to have_content(client.name())
  end
end

describe('the adding clients path', {:type => :feature}) do
  it("adds a client") do
    visit('/')
    fill_in('client_name', :with => "James")
    click_button('Add Client')
    expect(page).to have_content("James")
  end
end

describe('the adding clients to stylists path', {:type => :feature}) do
  it("adds a client to a stylist") do
    client = Client.new({name: "James", id: nil, stylist_id: 0})
    client.save()
    stylist = Stylist.new({name: "Rosey", id: nil})
    stylist.save()
    visit('/')
    click_link("Rosey")
    select("James")
    click_button('Add')
    expect(page).to have_content("James")
  end
end

describe('the changing clients name path', {:type => :feature}) do
  it("changes the name of a client") do
    client = Client.new({name: "James", id: nil, stylist_id: 0})
    client.save()
    visit('/')
    click_link("James")
    fill_in('name', :with => "Joe")
    click_button('Change')
    expect(page).to have_content("Joe")
  end
end

describe('the deleting clients path', {:type => :feature}) do
  it("deletes a client") do
    client = Client.new({name: "James", id: nil, stylist_id: 0})
    client.save()
    visit('/')
    click_link("James")
    click_button('Delete')
    expect(page).to have_no_content('James')
  end
end


describe('the changing stylists name path', {:type => :feature}) do
  it("changes the name of a stylist") do
    stylist = Stylist.new({name: "Ruby", id: nil})
    stylist.save()
    visit('/')
    click_link("Ruby")
    fill_in('name', :with => "Janna")
    click_button('Change')
    expect(page).to have_content("Janna")
  end
end

describe('the deleting stylsits path', {:type => :feature}) do
  it("deletes a stylist") do
    stylist = Stylist.new({name: "Ruby", id: nil})
    stylist.save()
    visit('/')
    click_link("Ruby")
    click_button("Delete")
    expect(page).to have_no_content('Ruby')
  end
end
