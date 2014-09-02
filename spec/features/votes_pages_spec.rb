require 'rails_helper'

describe "voting for a post" do
  it "allows a signed-in user to upvote" do
    visit '/sessions/new'
    user = User.create(username: 'test', password: 'password')
    Post.create(title: 'Google', link: 'http://www.google.com', user_id: user.id)
    fill_in 'Username', with: 'test'
    fill_in 'Password', with: 'password'
    click_button 'Log In'
    visit '/posts'
    click_button 'Vote'
    expect(page).to have_content 'upVote | 1'
  end
end
