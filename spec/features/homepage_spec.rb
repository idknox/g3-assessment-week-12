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

    expect(page).to have_content "The Wickerman (2006) lots of stuff"
  end

  scenario "fields must be filled and year must be number" do
    visit "/"
    click_on "Add Movie"

    click_on "Create Movie"

    expect(page).to have_content "Name can't be blank Year can't be blank Year is not a number"
  end

  scenario "Movies are ordered by year descending" do
    visit "/"
    click_on "Add Movie"
    fill_in "Name", :with => "The Rock"
    fill_in "Year", :with => "1996"
    fill_in "Synopsis", :with => "more stuff"
    click_on "Create Movie"

    click_on "Add Movie"
    fill_in "Name", :with => "The Wickerman"
    fill_in "Year", :with => "2006"
    fill_in "Synopsis", :with => "lots of stuff"
    click_on "Create Movie"

    expect(page).to have_content "The Wickerman (2006) lots of stuff The Rock (1996) more stuff"
  end
end