Fastui::Engine.routes.draw do

  resources :m_windows do
    resources :m_tabs
  end

  resources :m_tabs

  root :to => "admin#index"
end
