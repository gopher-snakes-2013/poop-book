require 'spec_helper'

feature 'Guest signs up' do
  scenario "it creates a user when they sign up" do
    visit '/'
    fill_in("sign_up_user_name", with: "goofy")
    fill_in("sign_up_password", with: "password")

    click_on "Sign Up"

    expect(page).to have_content("Welcome")
    expect(page).to have_content("goofy")
  end

  scenario "a user can login" do
    visit '/'
    fill_in("login_user_name", with: "goofy")
    fill_in("login_password", with: "password")

    click_on "Login"

    expect(page).to have_content("Welcome")
    expect(page).to have_content("goofy")
  end
end