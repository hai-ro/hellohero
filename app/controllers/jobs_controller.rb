class JobsController < ApplicationController
before_action :getdata, only: [:copied_new]
before_action :getprogress, only: [:index_progress]
before_action :authenticate_nursing_home!, only: [:new, :create, :edit, :update, :destroy, :order_confirm, :order_complete, :order_rejection, :ordered_index]
before_action :authenticate_hero!, only: [:order_request_confirm, :order_request_complete, :order_request_cancel]


  def index
    @jobs = Job.includes(:nursing_home, :hero, :job_category).order("updated_at DESC").where(progress: 0)
  end
  
  def ordered_index
    @jobs = Job.includes(:nursing_home, :hero, :job_category).order("updated_at DESC").where.not(progress: 5).where(nursing_home_id: current_nursing_home.id)
  end
  
  def index_progress
    getprogress
    if hero_signed_in?
      if @progress == 0
        redirect_to jobs_path
      else
        @jobs = Job.includes(:nursing_home, :hero, :job_category).order("updated_at DESC").where(hero_id: current_hero.id, progress: @progress)
      end
    elsif nursing_home_signed_in?
      @jobs = Job.includes(:nursing_home, :hero, :job_category).order("updated_at DESC").where(nursing_home_id: current_nursing_home.id, progress: @progress)
    else
      # ログインせずにアクセスしようとすると、トップページにリダイレクトされる
      redirect_to root_path
    end
  end
  
  def new
    @job = Job.new
    @nursing_home = NursingHome.find(current_nursing_home.id)
    @job_categories = JobCategory.all
  end
  
  def create
    Job.create!(job_params)
  rescue ActiveRecord::RecordInvalid => e
    pp e.record.errors
  end
  
  # ↓ココカラ 複製して投稿
  def copied_new
    @job = Job.new
    getdata
    @nursing_home = NursingHome.find(current_nursing_home.id)
    @job_categories = JobCategory.all
  end
  
  def copied_create
    Job.create!(job_params)
  end
  # ↑ココマデ 複製して投稿
  
  def show
    @job = Job.find(params[:id])
    @progress = @job.progress
    
    # 受注したヘルパーがログインしていて、かつ、進捗が4（事業所評価済み）の場合のみ、更新
    if hero_signed_in? && @job.progress == 4
      @job.update(progress: 5)
    end
  end
  
  def edit
    @job = Job.find(params[:id])
    @nursing_home = NursingHome.find(current_nursing_home.id)
    @job_categories = JobCategory.all
  end
  
  def update
    @job = Job.find(params[:id])
    Job.update(job_params)
  end
  
  def destroy
    @job = Job.find(params[:id])
    @job.destroy
  end
  
  # ヘルパーがエントリー
  def entry
    @job = Job.find(params[:id])
  end
  
  
  def entry_complete
    @job = Job.find(params[:id])
    @job.update( progress: 1, hero_id: current_hero.id)
  end
  
  # ヘルパーがエントリーをキャンセル
  def entry_cancel
    @job = Job.find(params[:id])
    @job.update( progress: 0, hero_id: 1)
  end
  
  # ヘルパーが事業所からの条件を承認
  def conditon_confirm
    @job = Job.find(params[:id])
  end
  
  # 条件承認完了画面
  def conditon_confirm_complete
    @job = Job.find(params[:id])
    @job.update( progress: 3)
  end
  
  # 事業所がヘルパーのエントリーを承認
  def entry_confirm
    @job = Job.find(params[:id])
  end
  
  # エントリー承認完了
  def entry_comfirm_complete
    @job = Job.find(params[:id])
    @job.update( progress: 2)
  end
  
  # 事業所がエントリーを却下
  def entry_rejection
    @job = Job.find(params[:id])
    @job.update( progress: 0, hero_id: 1)
  end
  
  # reviewコントローラのcreateアクションの後でリダイレクト
  def job_close_complete
    @job = Job.find(params[:id])
    @job.update( progress: 4)
  end
  
private
  def job_params
    params.require(:job).permit(:title, :price, :service, :expect, :nursing_home_id, :job_category_id, :start_datetime, :time, :progress, :hero_id, :area, :image, :image_cache, :remove_image)
  end
  
  # 進捗ごとに仕事を表示する（進捗取得用メソッド）
  def getprogress
    @progress = params[:format].to_i
  end
  
  # 投稿済みjobのレコードを取得する
  def getdata
      @data = Job.find(params[:format])
  end
end
