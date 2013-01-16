Fastui::Engine.routes.draw do

  resources :m_windows do
    resources :m_tabs
  end

  resources :m_tabs do
    resources :m_columns
    resources :m_fields
  end

  resources :m_lists do
    resources :m_list_items
  end


  resources :m_columns
  resources :m_fields
  resources :m_properties
  resources :m_entities
  resources :m_datatypes
  resources :m_relations
  resources :m_lists
  resources :m_list_items
  resources :m_orgs
  resources :m_people do
    collection do
      post 'login'
    end
  end
  resources :m_menus
  resources :m_menu_items

  root :to => "admin#index"
end
