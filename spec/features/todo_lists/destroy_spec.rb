require 'rails_helper'

describe "destroying todo list" do
	let!(:todo_list) { TodoList.create title: "Groceries", description: "Grocery list." }

	it "destroy the todo list correctly", js: true  do
		visit '/todo_lists'
		within "#todo_list_#{todo_list.id}" do
  			click_link "Destroy"
  			click_button('Accept')
  		end
  		expect(page).to have_content("Groceries")
	end
end