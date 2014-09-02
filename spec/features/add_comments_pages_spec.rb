require 'rails_helper'

describe 'Comment on a post' do
  it "Allows a logged-in user to comment on a post" do
    visit '/sessions/new'
    user = User.create(:username => 'test', :password => 'password')
    post = Post.create(title: 'Google', link: 'http://www.google.com', user_id: user.id)
    fill_in 'Username', with: 'test'
    fill_in 'Password', with: 'password'
    click_button 'Log In'
    visit "/users/#{user.id}/posts/#{post.id}"
    click_link "Comment"
    fill_in 'Content', with: "I commented!"
    click_button 'Create Comment'
    expect(page).to have_content "I commented!"
  end

  it "Redirects non-users to log in page if they want to comment on a post" do
    user = User.create(:username => 'test', :password => 'password')
    visit '/sessions/new'
    post = Post.create(title: 'Google', link: 'http://www.google.com', user_id: user.id)
    visit "/users/#{user.id}/posts/#{post.id}"
    click_link "Comment"
    expect(page).to have_content "Not authorized!"
  end
end
