require 'rails_helper'
require 'capybara/rails'

feature "Homepage" do
  scenario "User can see homepage at root" do
    visit "/"

    expect(page).to have_content "Cageflix Netflix for Nic Cage movies"
  end
end