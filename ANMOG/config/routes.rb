Rails.application.routes.draw do
  devise_for :skcs
  root to: "dashboard#index"

  get 'main/:id/edit', to: 'main#edit', as: :edit_main
  patch 'main/:id', to: 'main#update'
  delete '/main/:id', to: 'main#destroy', as:'main'

  get 'gbasubgroup/:id/edit' , to: 'gbasubgroup#edit' ,as: :edit_gbasubgroup
  patch 'gbasubgroup/:id', to: 'gbasubgroup#update'
  delete '/gbasubgroup/:id' , to: 'gbasubgroup#destroy' , as: 'gbasubrgoup'

  get 'subgroup/:id/edit' , to: 'subgroup#edit' ,as: :edit_subgroup
  patch 'subgroup/:id', to: 'subgroup#update'
  delete '/subgroup/:id' , to: 'subgroup#destroy' , as: 'subrgoup'

  get 'mains/:id/edit', to: 'mains#edit' ,as: :edit_mains

  get 'studies/:id/edit' , to: 'studies#edit' ,as: :edit_studies
  patch 'studies/:id', to: 'studies#update'
  delete '/studies/:id' , to: 'studies#destroy' , as: 'studies'

  get 'endpoints/:id/edit' , to: 'endpoints#edit' ,as: :edit_enpoints
  patch 'endpoints/:id', to: 'endpoints#update'
  delete '/endpoints/:id' , to: 'endpoints#destroy' , as: 'endpoints'

  get 'study_arms/:id/edit' , to: 'study_arms#edit' ,as: :edit_sturdy_arms
  patch 'study_arms/:id', to: 'study_arms#update'
  delete '/study_arms/:id' , to: 'study_arms#destroy' , as: 'study_arms'

  get 'apoasb/:id/edit' , to: 'apoabs#edit' ,as: :edit_apoabs
  patch 'apoabs/:id', to: 'apoabs#update'
  delete '/apoabs/:id' , to: 'apoabs#destroy' , as: 'apoabs'

  get 'preis_anmerkung/:id/edit' , to: 'preis_anmerkung#edit' ,as: :edit_preis_anmerkung
  patch 'preis_anmerkung/:id', to: 'preis_anmerkung#update'
  delete '/preis_anmerkung/:id' , to: 'preis_anmerkung#destroy' , as: 'preis_anmerkung'


  get 'schiedsspruch/:id/edit' , to: 'schiesspruch#edit' ,as: :edit_schiedsspruch
  patch 'schiedsspruch/:id', to: 'schiedsspruch#update'
  delete '/schiedsspruch/:id' , to: 'schiedsspruch#destroy' , as: 'schiedsspruch'


  resources :mains, only: [ :index, :show , :edit , :new]
  resources :jtkak, only: [ :index, :show, :create, :edit , :update , :destroy , :new]
  resources :jtkgb, only: [ :index, :show, :create, :edit , :update , :destroy]
  resources :jtkpv, only: [ :index, :show, :create, :edit , :update , :destroy]


  resources :jtkpvh, only: [:destroy]
  resources :jtkakt, only: [:destroy]
  resources :jtkgba, only: [:destroy]
  resources :preis_anmerkung, only: [ :index, :create , :destroy , :edit , :new]
  resources :pzn, only: [ :index, :edit , :new ,:show]


  resources :subgroup, only: [ :index, :show, :create, :edit , :update , :destroy , :new]
  resources :studies, only: [ :index, :create ,:destroy , :edit , :new]
  resources :main, only: [ :index, :create, :show , :destroy, :edit, :update , :new]
  resources :dashboard, only: [:index]
  resources :iqsubgroup, only: [ :index , :create, :destroy ,:edit , :update , :new]
  resources :gbasubgroup, only: [ :index , :create, :destroy ,:edit , :update , :new]
  resources :study_arms, only: [ :index, :create , :destroy , :edit , :new]
  resources :endpoints , only: [ :index, :show, :create, :edit , :update , :destroy, :new]
  resources :apoabs , only: [ :index, :show, :create, :edit , :update , :destroy , :new]
  resources :schiedsspruch , only: [:index , :new , :create , :destroy , :show]
  resources :pzn do
	collection {post :import}
  end	
  resources :mains do
        collection {post :export}
  end
  resources :jtkakt do
        collection {post :trigger}
  end
  resources :jtkgba do
        collection {post :trigger}
  end
  resources :jtkpvh do
        collection {post :trigger}
  end

end
