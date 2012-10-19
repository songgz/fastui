Fastui::Engine.routes.draw do

  resources :m_windows do
    resources :m_tabs
  end

  root :to => "admin#index"
end
