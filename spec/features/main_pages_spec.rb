require 'rails_helper'

describe 'Post comments' do
  it "allows anyone to view post comments" do
    visit '/sessions/new'
    user = User.create(username: 'test', password: 'password')
    post = Post.create(title: 'Google', link: 'http://www.google.com')
    fill_in 'Username', with: 'test'
    fill_in 'Password', with: 'password'
    click_button 'Log In'
    post = Post.create(title: 'Google', link: 'http://www.google.com', user_id: user.id)
    visit "/users/#{user.id}/posts/#{post.id}"
    expect(page).to have_content "Google - #{user.username}"
  end
end
