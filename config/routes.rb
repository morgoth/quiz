ActionController::Routing::Routes.draw do |map|
  map.resource :account, :controller => "users"
  map.resources :users
  map.resources :students, :only => [:index, :new, :create, :destroy]
  map.resource :user_session
  map.resources :teacher_questions
  map.resources :teacher_answers, :except => [:index, :show]
  map.resources :teacher_exams
  map.resources :student_imports, :only => [:new, :create]
  map.resources :mass_exams, :only => [:new, :create]
  map.resources :exams do |exams|
    exams.resources :questions, :only => [:index, :edit, :update]
  end
  map.root :controller => "user_sessions", :action => "new"

end
