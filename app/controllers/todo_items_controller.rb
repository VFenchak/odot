class TodoItemsController < ApplicationController
  before_action :find_todo_list
  
  def index
    
  end
  #complete_todo_list_todo_item
  #Agregar la accion e hipervinculo
  def new
   
    @todo_item = @todo_list.todo_items.new
  end
  
  def create
    
    @todo_item = @todo_list.todo_items.new todo_item_params
    
    if @todo_item.save
      flash[:success] = "Added todo_list item."
      redirect_to todo_list_todo_items_path(@todo_list)
    else
      flash[:error] = "Problem to save todo_list item"
      render action: :new
    end
  end
  
  private
    def todo_item_params
      params[:todo_item].permit(:content)
    end
    
    def find_todo_list
      @todo_list = TodoList.find(params[:todo_list_id])
    end
end
