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
  
  it "show one error if title is empty" do
    expect(TodoList.count).to eq(0)
    visit '/todo_lists'
    click_link 'New Todo list'
    fill_in 'Title', with: ''
    fill_in 'Description', with: 'Some description'
    click_button 'Create Todo list'
    expect(page).to have_content 'error'
    expect(TodoList.count).to eq(0)
    visit '/todo_lists'
    expect(page).to_not have_content 'Some description'
  end
  
  it "title should be > 3" do
    expect(TodoList.count).to eq(0)
    visit '/todo_lists'
    click_link 'New Todo list'
    fill_in 'Title', with: 'HI'
    fill_in 'Description', with: 'So'
    click_button 'Create Todo list'
    expect(page).to have_content 'error'
    expect(TodoList.count).to eq(0)
    visit '/todo_lists'
    expect(page).to_not have_content 'Some description'
  end
  # describe "title" do
#     subject = TodoList.new
#     subject.title = "HOLA"
#
#     it "must be instance of TodoList" do
#       #@lista.must_be_instance_of TodoList
#       expect(subject).to be_a TodoList
#     end
#
#     it "title must not be empty" do
#       #Old syntax -> change it
#       subject.title.length.should > 0
#     end
#   end
end