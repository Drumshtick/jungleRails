require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do

  before :each do
    @user = User.create(
      first_name: "Cookie",
      last_name: "Monster",
      email: "eatdem@cookies.com",
      password: "password",
      password_confirmation: "password"
    )
  end

  scenario "user is signed in after sign in form submission" do
    visit 'login'

    fill_in 'email', with: 'eatdem@cookies.com'
    fill_in 'password', with: 'password'
    click_on "Submit"
    
    expect(page.has_content?("Login")).to be_falsy
    puts page.html
  end
end
