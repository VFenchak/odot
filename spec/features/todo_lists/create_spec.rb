require 'rails_helper'

describe "creating todo_lists" do
  it "redirects to the index page on sucess" do
    visit '/todo_lists'
    click_link 'New Todo list'
    fill_in 'Title', with: 'My Todo list'
    fill_in 'Description', with: 'Some description'
    click_button 'Create Todo list'
    expect(page).to have_content 'My Todo list'
  end
end