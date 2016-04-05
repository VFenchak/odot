require 'rails_helper'

describe "creating todo items" do
  let!(:todo_list) { TodoList.create title: "Groceries", description: "Grocery list." }
  let!(:todo_item) { todo_list.todo_items.create content: "Test item" }
  def visit_todo_list list
    visit "/todo_lists"
		within "#todo_list_#{list.id}" do
  			click_link "List items"
  	end
  end
  
  it "successfull when todo item is complete" do
    visit_todo_list todo_list
    expect(todo_item.completed_at).to be_nil
		within "#todo_item_#{todo_item.id}" do
  			click_link "Complete"
  	end
    todo_item.reload
    #Que no este nulo to not be nil
  end
end