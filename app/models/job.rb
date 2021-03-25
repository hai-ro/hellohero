class Job < ApplicationRecord
  # アソシエーション
  belongs_to :job_category
  belongs_to :nursing_home
  belongs_to :hero
  has_one :review
  
  # アップロード
  mount_uploader :image, ImageUploader
  
  scope :search, -> (search_params) do
    # search_paramsが空の場合以降の処理を行わない。
    # >> [].blank?
    # => true
    return if search_params.blank?
    
    # パラメータを指定して検索を実行する
    title_like(search_params[:title])
      .job_category_id_is(search_params[:job_category_id])
      .date_is(search_params[:date])
      .time_from(search_params[:time_from])
      .time_to(search_params[:time_to])
  end
  
  # titleが存在する場合、titleをlike検索する
  scope :title_like, -> (title) { where('title LIKE ?', "%#{title}%") if title.present? }
  # job_category_idが存在する場合、job_category_idをlike検索する
  scope :job_category_id_is, -> (job_category_id) { where(job_category_id: job_category_id) if job_category_id.present? }
  # start_datetimeが存在する場合、start_datetimeで検索する
  scope :date_is, -> (date) { where( datetime: date) if date.present? }
  # timeが存在する場合、timeで範囲検索する
  scope :time_from, -> (from) { where( '? <= time', from) if from.present? }
  scope :time_to, -> (to) { where( 'time <= ?', to) if to.present? }
end
