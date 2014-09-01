require 'rails_helper'

describe "the signin process" do
  it "signs a user in who uses the right password" do
    visit '/sessions/new'
    user = User.create(:username => 'test', :password => 'password')
    fill_in 'Username', :with => 'test'
    fill_in 'Password', :with => 'password'
    click_button 'Log In'
    page.should have_content 'Check out our cool new posts!'
  end

  it "gives a user an error who uses the wrong password" do
    visit '/sessions/new'
    user = User.create(:username => 'test', :password => 'password')
    fill_in 'Username', :with => 'test'
    fill_in 'Password', :with => 'wrong'
    click_button 'Log In'
    page.should have_content 'Check that username and password again.'
  end
end
