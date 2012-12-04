class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    @list = List.new(params[:list])
    if @list.save
      redirect_to @list, notice: "List was created" 
    else
      flash[:alert] = "List wasn't created :("
      render action: "new"
    end
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update_attributes(params[:list])
      redirect_to @list, notice: "List was updated" 
    else
      flash[:alert] = "List wasn't updated :("
      render action: "edit"
    end
  end

  def destroy
    @list = List.find(params[:id])
    if @list.destroy
        flash[:notice] = "List was destroyed successfully"
        respond_to do |format|
          format.html { redirect_to root_url }
        end
    else
       flash[:alert] = "List wasn't destroyed"
       respond_to do |format|
          format.html { redirect_to root_url }
        end
    end
  end
end
