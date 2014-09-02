require 'rails_helper'

describe 'Comment on a post' do
  it "allows anyone to view post comments" do
    visit '/sessions/new'
    user = User.create(:username => 'test', :password => 'password')
    post = Post.create(title: 'Google', link: 'http://www.google.com')
    fill_in 'Username', with: 'test'
    fill_in 'Password', with: 'password'
    click_button 'Log In'
    post = Post.create(title: 'Google', link: 'http://www.google.com', user_id: user.id)
    visit "/users/#{user.id}/posts/#{post.id}"
    click_link "Comment"
    fill_in 'Content', with: "I commented!"
    click_button 'Create Comment'
    expect(page).to have_content "I commented!"
  end
end
