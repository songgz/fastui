Fastui::Engine.routes.draw do

  resources :m_windows do
    resources :m_tabs do
      resources :m_columns
      resources :m_fields
    end
  end

  resources :m_glossaries do
    resources :m_glossary_items
  end

  resources :m_tabs
  resources :m_columns
  resources :m_fields
  resources :m_properties
  resources :m_entities
  resources :m_glossaries
  resources :m_glossary_items
  resources :m_orgs
  resources :m_people

  root :to => "admin#index"
end
