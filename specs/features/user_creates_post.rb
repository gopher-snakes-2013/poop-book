require 'spec_helper'
require 'capybara/rspec'

feature 'Guest creates post' do
  scenario "it creates the post when they provide text" do
    visit '/'
    # fill_in "New Post", with: "wtf"

    # click_on "Submit"

    # expect(page).to have_content("wtf")
  end
end