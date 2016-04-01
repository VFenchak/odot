require 'rails_helper'

describe "viewing todo items" do
  let!(:todo_list) { TodoList.create title: "Groceries", description: "Grocery list." }
  def visit_todo_list list
    visit "/todo_lists"
		within "#todo_list_#{list.id}" do
  			click_link "List items"
  	end
  end
  
  it "displays todo_list title" do
    visit_todo_list todo_list
		within "h1" do
  			expect(page).to have_content(todo_list.title)
  	end
  end
  
  it "displays no items when a todo list is empty" do
    visit_todo_list todo_list
    expect(page.all('ul.todo_items li').size).to eq(0)
  end
  
  #Dentro de la vista para pasar el test
  it "displays item content when a todo list has items" do
    todo_list.todo_items.create content: “Milk”
    todo_list.todo_items.create content: “Eggs”
    visit_todo_list todo_list
    expect(page.all('ul.todo_items li').size).to eq(2)
		within 'ul.todo_items' do
  			expect(page).to have_content("Milk")
        expect(page).to have_content("Eggs")
  	end
  end
end