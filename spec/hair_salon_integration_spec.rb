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
