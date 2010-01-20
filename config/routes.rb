ActionController::Routing::Routes.draw do |map|
  map.filter :locale

  map.resource :home, :only => [:show]
  map.resource :language, :only => :update
  map.resource :account, :controller => "users"
  map.resources :users, :only => [:show, :edit, :update]
  map.resources :teachers, :only => [:new, :create]
  map.resources :students, :only => [:index, :new, :create, :destroy, :edit, :update]
  map.resource :user_session
  map.resources :teacher_questions
  map.resources :teacher_answers, :except => [:index, :show]
  map.resources :teacher_exams
  map.resources :student_imports, :only => [:new, :create]
  map.resources :mass_exams, :only => [:new, :create]
  map.resources :exams do |exams|
    exams.resources :questions, :only => [:index, :edit, :update]
  end
  map.root :controller => "homes", :action => "show"
end
