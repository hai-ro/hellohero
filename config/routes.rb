Rails.application.routes.draw do
  root "tops#index"
  
  resources :jobs
  # ヘルパーがエントリーする際のルーティング
  get "jobs/order_request_confirm/:id" => "jobs#order_request_confirm"
  get "jobs/order_request_complete/:id" => "jobs#order_request_complete"
  get "jobs/order_request_cancel/:id" => "jobs#order_request_cancel"
  get "jobs/order_agreement_confirm/:id" => "jobs#order_agreement_confirm"
  get "jobs/order_agreement_conmplete/:id" => "jobs#order_agreement_complete"
  # 事業所がエントリーを承認する際のルーティング
  get "jobs/order_confirm/:id" => "jobs#order_confirm"
  get "jobs/order_complete/:id" => "jobs#order_complete"
  get "jobs/order_rejection/:id" => "jobs#order_rejection"
  get "jobs/order_close_confirm/:id" => "jobs#order_close_confirm"
  get "jobs/order_close_complete/:id" => "jobs#order_close_complete"
  resources :clients, only: [:index, :show, :new, :create, :destroy]
  resources :rooms
  resources :reviews
  resources :heros_rules, only: [:index]
  resources :job_categories, only: [:new, :create]
  
  devise_for :heros, controllers: {
    sessions:      'heros/sessions',
    passwords:     'heros/passwords',
    registrations: 'heros/registrations'
  }
  resources :heros, only: [:show, :update]
  
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  
  devise_for :nursing_homes, controllers: {
    sessions:      'nursing_homes/sessions',
    passwords:     'nursing_homes/passwords',
    registrations: 'nursing_homes/registrations'
  }
  resources :nursing_homes, only: [:show]
  
  
end
