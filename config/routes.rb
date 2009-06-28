ActionController::Routing::Routes.draw do |map|
  map.resource :account, :controller => "users"
  map.resources :users
  map.resource :user_session
  map.resources :teacher_questions
  map.resources :teacher_answers, :except => [:index, :show]
  map.resources :teacher_exams
  map.resources :exams do |exams|
    exams.resources :questions, :only => [:index, :edit, :update]
  end
  map.root :controller => "user_sessions", :action => "new"

end
