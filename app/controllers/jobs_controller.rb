class JobsController < ApplicationController
before_action :authenticate_nursing_home!, only: [
  :new, :create, :edit, :update, :destroy, 
  :order_confirm, :order_complete, :order_rejection
]
before_action :authenticate_hero!, only: [
  :order_request_confirm, :order_request_complete, :order_request_cancel
]

  def index
    @jobs = Job.order("created_at DESC").all
  end
  
  def show
    @job = Job.find(params[:id])
    @progress = @job.progress
  end
  
  def new
    @job = Job.new
    @nursing_home = NursingHome.find(current_nursing_home.id)
    @job_categories = JobCategory.all
    @clients = Client.where(nursing_home_id: current_nursing_home.id)
  end
  
  def create
    Job.create(job_params)
  end
  
  def edit
    @job = Job.find(params[:id])
    @nursing_home = NursingHome.find(current_nursing_home.id)
    @job_categories = JobCategory.all
    @clients = Client.where(nursing_home_id: current_nursing_home.id)
  end
  
  def update
    @job = Job.find(params[:id])
    Job.update(job_params)
  end
  
  def destroy
    @job = Job.find(params[:id])
    @job.destroy
  end
  
  # ヘルパーがエントリーをするときのアクション
  def order_request_confirm
    @job = Job.find(params[:id])
  end
  
  def order_request_complete
    @job = Job.find(params[:id])
    @job.update( progress: 1, hero_id: current_hero.id)
  end
  # ヘルパーがエントリーをキャンセル
  def order_request_cancel
    @job = Job.find(params[:id])
    @job.update( progress: 0)
  end
  
  # ヘルパーが事業所からの条件を承認
  def order_agreement_confirm
    @job = Job.find(params[:id])
  end
  
  def order_agreement_complete
    @job = Job.find(params[:id])
    @job.update( progress: 3)
  end
  
  # 事業所がヘルパーのエントリーを承認するためのアクション
  def order_confirm
    @job = Job.find(params[:id])
  end
  
  def order_complete
    @job = Job.find(params[:id])
    @job.update( progress: 2)
  end
  # 事業所がエントリーを却下
  def order_rejection
    @job = Job.find(params[:id])
    @job.update( progress: 0)
  end
  
  # ヘルパーが仕事を終えた際に入力
  def order_close_confirm
    @job = Job.find(params[:id])
  end
  
  def order_close_complete
    @job = Job.find(params[:id])
    @job.update( progress: 4)
  end
  
  # def follow
  #   @job = Job.find(params[:job_id])
  #   current_hero.follow(@job)
  #   redirect_to hero_path(@job)
  # end
  
  # def unfollow
  #   @job = Job.find(params[:job_id])
  #   current_hero.stop_following(@hero)
  #   redirect_to hero_path(@hero)
  # end
  
  # def follow_list
  #   @job = Job.find(params[:job_id])
  # end
  
  # def follower_list
  #   @job = Job.find(params[:job_id])
  # end
  
  private
  def job_params
    params.require(:job).permit(:title, :price, :service, :expect, :nursing_home_id, :client_id, :job_category_id, :start_datetime, :end_datetime, :progress, :hero_id)
  end
  
end
