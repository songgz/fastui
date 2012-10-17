Fastui::Engine.routes.draw do
  #namespace :fastui do
    resources :m_windows
  #end
  root :to => "admin#index"
end
