class TasksController < ApplicationController
  def create
  	@list = List.find(params[:list_id])
  	@task = @list.tasks.build(params[:task])
  	if @task.save
	  respond_to do |format|
        format.html {redirect_to list_path(@list), :notice => "Your task was created :)"}
        format.js
      end  			
  	else
  	  respond_to do |format|
	    format.html {redirect_to list_path(@list), :alert => "Your task couldn't be submitted. :("}
	    format.js
      end
  	end
  end

  def destroy
  	@list = List.find(params[:list_id])
  	@task = Task.find(params[:id])	
  	if @task.destroy
	  respond_to do |format|
        format.html {redirect_to list_path(@list), :notice => "Your task was destroy susscefully :)"}
        format.js
      end  			
  	else
  	  respond_to do |format|
	    format.html {redirect_to list_path(@list), :alert => "Your task couldn't be destroy. :("}
	    format.js
      end
  	end
  end

  def edit
  	@list = List.find(params[:list_id])
	@task = Task.find(params[:id])
  end

  def update
  	@list = List.find(params[:list_id])
  	@task = Task.find(params[:id])
  	if @task.update_attributes(params[:task])
  		redirect_to @list, notice: "Task was updated" 
		else
	  		flash[:alert] = "Task wasn't updated :("
	  		render action: "edit"
		end
    end
end
