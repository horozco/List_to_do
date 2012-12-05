Todolist::Application.routes.draw do
  
  resources :lists do
    resources :tasks
  end

  match "lists/:list_id/tasks/:id/change_status" => "tasks#change_status", :as => "change_status_task"

  root :to => "lists#index"
end