Rails.application.routes.draw do
  root "tops#index"
  
  get "jobs/copied_new" => "jobs#copied_new"
  post "jobs/copied_create" => "jobs#copied_create"
  # 【こっちに統合】進捗ごとに一覧を表示
  get "jobs/index" => "jobs#index_progress"
  resources :jobs do 
  
    resources :reviews
  
  end
  
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

  resources :rooms
  resources :heros_rules, only: [:index]
  resources :job_categories, only: [:new, :create]
  
  devise_for :heros, controllers: {
    sessions:      'heros/sessions',
    passwords:     'heros/passwords',
    registrations: 'heros/registrations'
  }
  
  devise_scope :hero do
    get "heros/confirmation" => "heros/registrations#confirmation"
  end
  
  resources :heros, only: [:show]
  
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
