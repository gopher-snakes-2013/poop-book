require 'spec_helper'

feature 'Guest signs up' do
  scenario "it creates a user when they sign up" do
    visit '/'
    fill_in("sign_up_user_name", with: "user")
    fill_in("sign_up_password", with: "password")

    click_on "Sign Up"

    expect(page).to have_content("Welcome")
    expect(page).to have_content("user")
  end

  #def sign_up_with(user,password)
  #create function to dry up code
end