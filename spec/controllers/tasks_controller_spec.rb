require "spec_helper"

describe TasksController do
  before(:all) do
    @existing_list = create(:list)
  end

  it "should allow to enter a new task to a given list and store it if valid, the task status should be false. Should show the list page with a flash notice message" do
    expect {
      post :create, {
        list_id: @existing_list.id,
        task: attributes_for(:task)
      }
    }.to change { @existing_list.task.count }.by(1)
    #@existing_list.status.should eql(false)
    flash[:notice].should_not be_nil
    response.should redirect_to(list_path(@existing_list))
  end

  it "shouldn't allow to enter an invalid task to a given list. Should show the list page with a flash error message" do
    expect {
      post :create, {
        list_id: @existing_list.id,
        task: attributes_for(:invalid_task)
      }
    }.to change { @existing_list.tasks.count }.by(0)
    flash[:alert].should_not be_nil
    response.should redirect_to(list_path(@existing_list))
  end

  it "should be able to delete an existing task. The user redirected to the list page with a flash notice message" do
    post :create, {
      list_id: @existing_list.id,
      task: attributes_for(:invalid_task)
      created_task = assigns[:task]
    }
    expect {
      delete :destroy,id: created_task.id        
    }.to change { @existing_list.tasks.count }.by(-1)
    response.should redirect_to(list_path(@existing_list))
    flash[:notice].should_not be_nil 
  end   
end