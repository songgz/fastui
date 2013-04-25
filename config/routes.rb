Fastui::Engine.routes.draw do
  resources :m_views
  resources :m_lists do
    resources :m_list_items
  end
  resources :m_lists
  resources :m_list_items
  resources :m_orgs
  resources :m_people
  resources :m_roles
  resources :m_menus
  resources :m_menu_items
  resources :sessions do
    collection do
      post 'login'
    end
  end
  root :to => "admin#index"
end
