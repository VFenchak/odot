class TodoList < ActiveRecord::Base
  has_many :todo_items
  
  validates :title, presence: true, length: {minimum: 4}
  validates :description, presence: true, length: {minimum: 6}
end
