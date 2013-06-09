Fastui::Engine.routes.draw do
  resources :m_views
  resources :m_lists do
    resources :m_list_items
  end
  resources :m_list_items
  resources :m_orgs
  resources :m_people
  resources :m_roles
  resources :m_person_roles
  resources :m_org_accesses
  resources :m_window_accesses
  resources :m_menus
  resources :m_menu_items
  resources :m_helps
  resources :sessions do
    collection do
      post 'login'
    end
  end
  root :to => "admin#index"
end
