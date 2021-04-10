Rails.application.routes.draw do
  root "tops#index"
  
  # jobs_controller系
  get "jobs/copied_new" => "jobs#copied_new"
  post "jobs/copied_create" => "jobs#copied_create"
  # 【こっちに統合】進捗ごとに一覧を表示
  get "jobs/index" => "jobs#index_progress"
  get "jobs/ordered_index" => "jobs#ordered_index"
  resources :jobs do 
    # レビュー絡み
    resources :reviews
  end
  # ヘルパーがエントリー
  get "jobs/entry/:id" => "jobs#entry"
  # エントリー完了
  get "jobs/entry_complete/:id" => "jobs#entry_complete"
  # エントリー取り下げ
  get "jobs/entry_cancel/:id" => "jobs#entry_cancel"
  # 労働条件提示書承認入力
  get "jobs/condition_confirm/:id" => "jobs#condition_confirm"
  # 労働条件提示書確認完了
  get "jobs/condition_complete/:id" => "jobs#condition_complete"
  # 事業所がエントリーを承認
  get "jobs/entry_confirm/:id" => "jobs#entry_confirm"
  # エントリー承認後
  get "jobs/entry_confirm_complete/:id" => "jobs#entry_confirm_complete"
  # エントリーを却下
  get "jobs/entry_rejection/:id" => "jobs#entry_rejection"
  # 仕事完了を確認
  get "jobs/job_close/:id" => "jobs#job_close"
  # 完了入力後
  get "jobs/job_close_complete/:id" => "jobs#job_close_complete"

  # チャットルーム
  resources :rooms
  # 仕事のカテゴリー
  resources :job_categories, only: [:new, :create]

  # ヘルパー絡み
  devise_for :heros, controllers: {
    sessions:      'heros/sessions',
    passwords:     'heros/passwords',
    registrations: 'heros/registrations',
    confirmations: 'heros/confirmations'
  }
  devise_scope :hero do
    get "heros/confirmation" => "heros/registrations#confirmation"
  end
  
  # 登録完了の画面
  get "heros/success"
  # メール認証を依頼する画面
  get "heros/checkmail"
  # 利用規約の確認
  get "heros/rules" => "heros#rules"
  # ヘルパーのプロフィールを表示
  get "heros/profile/:id" => "heros#profile"
  # ヘルパーのマイページを表示
  resources :heros, only: [:show]
  
  # 管理者絡み
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  
  # 介護事業所絡み
  devise_for :nursing_homes, controllers: {
    sessions:      'nursing_homes/sessions',
    passwords:     'nursing_homes/passwords',
    registrations: 'nursing_homes/registrations',
    confirmations: 'nursing_homes/confirmations'
  }
  # 登録完了の画面
  get "nursing_homes/success"
  # メール認証を依頼する画面
  get "nursing_homes/checkmail"
  get "nursing_homes/profile/:id" => "nursing_homes#profile"
  resources :nursing_homes, only: [:show]

end
