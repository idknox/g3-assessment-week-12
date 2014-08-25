require 'rails_helper'
require 'capybara/rails'

feature "Movies" do
  scenario "User can see homepage at root" do
    visit "/"

    expect(page).to have_content "Cageflix Netflix for Nic Cage movies"
  end

  scenario "User can add movies and see them on homepage" do
    visit "/"
    click_on "Add Movie"

    fill_in "Name", :with => "The Wickerman"
    fill_in "Year", :with => "2006"
    fill_in "Synopsis", :with => "lots of stuff"
    click_on "Create Movie"

    expect(page).to have_content "The Wickerman 2006 lots of stuff"
  end
end