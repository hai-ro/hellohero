Rails.application.routes.draw do
  root "tops#index"
  
  resources :jobs do 
  
    resources :reviews
  
  end
  # ヘルパーがエントリーする際のルーティング
  get "jobs/order_request_confirm/:id" => "jobs#order_request_confirm"
  get "jobs/order_request_complete/:id" => "jobs#order_request_complete"
  get "jobs/order_request_cancel/:id" => "jobs#order_request_cancel"
  get "jobs/order_agreement_confirm/:id" => "jobs#order_agreement_confirm"
  get "jobs/order_agreement_conmplete/:id" => "jobs#order_agreement_complete"
  
  # 進捗ごとに一覧を表示するためのルーティング（ヘルパー）
  get "jobs/index/1/hero/:id" => "jobs#index_1_hero" # エントリー済のjob
  get "jobs/index/2/hero/:id" => "jobs#index_2_hero" # 事業者がヘルパーに発注済みのjob
  get "jobs/index/3/hero/:id" => "jobs#index_3_hero" # 契約が成立し、業務遂行待ちのjob
  get "jobs/index/4/hero/:id" => "jobs#index_4_hero" # 業務遂行完了を事業者が確認、ヘルパーが完了報告を未確認のjob
  get "jobs/index/5/hero/:id" => "jobs#index_5_hero" # 業務遂行完了を事業者が確認、ヘルパーも完了報告を確認済のjob
  
  
  # 事業所がエントリーを承認する際のルーティング
  get "jobs/order_confirm/:id" => "jobs#order_confirm"
  get "jobs/order_complete/:id" => "jobs#order_complete"
  get "jobs/order_rejection/:id" => "jobs#order_rejection"
  get "jobs/order_close_confirm/:id" => "jobs#order_close_confirm"
  get "jobs/order_close_complete/:id" => "jobs#order_close_complete"
  
  # 進捗ごとに一覧を表示するためのルーティング（事業所）
  get "jobs/index/1/nursing_home/:id" => "jobs#index_1_nursing_home" # エントリー済のjob
  get "jobs/index/2/nurding_home/:id" => "jobs#index_2_nursing_home" # 事業者がヘルパーに発注済みのjob
  get "jobs/index/3/nursing_home/:id" => "jobs#index_3_nursing_home" # 契約が成立し、業務遂行待ちのjob
  get "jobs/index/4/nursing_home/:id" => "jobs#index_4_nursing_home" # 業務遂行完了を事業者が確認、ヘルパーが完了報告を未確認のjob
  get "jobs/index/5/nursing_home/:id" => "jobs#index_5_nursing_home" # 業務遂行完了を事業者が確認、ヘルパーも完了報告を確認済のjob

  resources :clients, only: [:index, :show, :new, :create, :destroy]
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
