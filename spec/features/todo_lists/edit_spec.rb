require 'rails_helper'

describe "editing todo list" do
	let!(:todo_list) { TodoList.create title: "Groceries", description: "Grocery list." }
	
  def update_todo_list(options={})
    options[:title] ||= "New title"
    options[:description] ||= "New description"
    todo_list = options[:todo_list]
    visit '/todo_lists'
  	within "#todo_list_#{todo_list.id}" do
  		click_link "Edit"
  	end
    
    fill_in 'Title', with: options[:title]
    fill_in 'Description', with: options[:description]
    click_button 'Update Todo list'
  end
  
  it "updates a todo list successfully with correct information" do
    update_todo_list todo_list: todo_list
  	
    #recargamos la variable
    todo_list.reload
  	expect(page).to have_content("Todo list was successfully updated")
  	expect(todo_list.title).to eq("New title")
  	expect(todo_list.description).to eq("New description")
  end

  it "updates a todo list successfully if title is not empty" do
    update_todo_list todo_list: todo_list, title: ''
    todo_list.reload
    expect(page).to have_content 'error'
    expect(todo_list.description).to_not eq("New description")
  end

  it "title length must be > 3 chars" do
    update_todo_list todo_list: todo_list, title: 'Hi'
    todo_list.reload
    expect(page).to have_content 'error'
    expect(page).to_not have_content 'Hi'
    expect(todo_list.title).to_not eq("Hi")
  end

  it "updates a todo list successfully if description is not empty" do
    update_todo_list todo_list: todo_list, description: ''
    todo_list.reload
    expect(page).to have_content 'error'
    expect(todo_list.description).to_not eq('')
  end

  it "description length must be > 5 chars" do
    update_todo_list todo_list: todo_list, description: 'Test'
    todo_list.reload
    expect(page).to have_content 'error'
    expect(todo_list.description).to_not eq('Test')
  end

end