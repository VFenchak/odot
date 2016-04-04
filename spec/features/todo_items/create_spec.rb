require 'rails_helper'

describe "creating todo items" do
  let!(:todo_list) { TodoList.create title: "Groceries", description: "Grocery list." }
  def visit_todo_list list
    visit "/todo_lists"
		within "#todo_list_#{list.id}" do
  			click_link "List items"
  	end
  end
  
  it "is successful with a valid content" do
    visit_todo_list todo_list
    click_link "Create item"
    fill_in 'Content', with: "Test item"
    click_button "Save item"
    expect(page).to have_content 'Added todo_list item.'
		within "ul.todo_items" do
  			expect(page).to have_content 'Test item'
  	end
  end
  # > 3 chars
  # que tenga contenido el todo item al crearlo
  
end