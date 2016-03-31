require 'rails_helper'

describe "creating todo_lists" do
  #let!(:todo_list) { TodoList.create title: "My Todo list", description: "Some description" }

  def create_todo_list(options={})
    options[:title] ||= "My Todo list"
    options[:description] ||= "Some description"
    
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

  it "show one error if description is empty" do
    expect(TodoList.count).to eq(0)
    create_todo_list description: ''
    expect(page).to have_content 'error'
    expect(TodoList.count).to eq(0)
    visit '/todo_lists'
    expect(page).to_not have_content 'My Todo list'
  end

  it "description should be > 5" do
    expect(TodoList.count).to eq(0)
    create_todo_list description: 'Ops'
    expect(page).to have_content 'error'
    expect(TodoList.count).to eq(0)
    visit '/todo_lists'
    expect(page).to_not have_content 'My Todo list'
  end
end