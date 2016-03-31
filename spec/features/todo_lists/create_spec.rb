require 'rails_helper'

describe "creating todo_lists" do
  def create_todo_list(options={})
    options[:title] ||= "My todo list"
    options[:description] ||= "This is my todo list"
    
    visit '/todo_lists'
    click_link 'New Todo list'
    
    fill_in 'Title', with: options[:title]
    fill_in 'Description', with: options[:description]
    click_button 'Create Todo list'
  end

  it "redirects to the index page on sucess" do
    create_todo_list
    expect(page).to have_content 'My Todo list'
  end
  
  it "show one error if title is empty" do
    expect(TodoList.count).to eq(0)
    create_todo_list title: ''
    expect(page).to have_content 'error'
    expect(TodoList.count).to eq(0)
    visit '/todo_lists'
    expect(page).to_not have_content 'Some description'
  end
  
  it "title should be > 3" do
    expect(TodoList.count).to eq(0)
    create_todo_list title: 'Hi'
    expect(page).to have_content 'error'
    expect(TodoList.count).to eq(0)
    visit '/todo_lists'
    expect(page).to_not have_content 'Some description'
  end
end