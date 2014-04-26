require 'spec_helper'

feature "Viewing comments" do
  before do
    # setup everything you need - in this case, probably a good idea to set up
    # two Posts, each with 1 Comment
  post_1 = FactoryGirl.create(:post,
    title: "Post 1", content: "Post 1 content", author: "Jerry")
#  FactoryGirl.create(:comment,post:post_1, content: "first comment for Post 1",
#    author: "Joe")

    user = FactoryGirl.create(:user)
    comment = FactoryGirl.create(:comment,
      post: post_1,
      content: "first comment for Post 1",
      author: "Joe")
    comment comment.update(user: user)
    
  post_2 = FactoryGirl.create(:post,
    title: "Post 2", content: "Post 2 content", author: "Kerry")
#  FactoryGirl.create(:comment,post:post_2, content: "1st comment for Post 2",
#   author: "Joe")

    user = FactoryGirl.create(:user)
    comment = FactoryGirl.create(:comment,
      post: post_2,
      content: "1st comment for Post 2",
      author: "Joe")
    comment comment.update(user: user)

  visit '/'    
  end

scenario "viewing comments for a particular post" do
    # navigate to Post you want to check

    # assert that you'll find the comment (author and content) associated with post to which you navigated

    # assert that you did not find comment associated with the other post
  click_link "Post 2"
  expect(page).to have_content("Post 2 content")
  expect(page).to_not have_content("Post 1 content")
#click_link "Make it shiny!"
#within("#ticket h2") do
  expect(page).to have_content("1st comment for Post 2")
  expect(page).to_not have_content("first comment for Post 1")
  end

end
