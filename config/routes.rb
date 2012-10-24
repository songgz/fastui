Fastui::Engine.routes.draw do

  resources :m_windows do
    resources :m_tabs do
      resources :m_columns
      resources :m_fields
    end
  end

  resources :m_tabs
  resources :m_columns
  resources :m_fields

  root :to => "admin#index"
end
