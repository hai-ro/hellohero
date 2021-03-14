class ReviewsController < ApplicationController
  def index
    
  end
  
  def show
    
  end
  
  def new
    @job = Job.includes(:nursing_home, :hero).find(params[:job_id])
    @review = Review.new
  end
  
  def create
    Review.create(review_params)
    redirect_to("/jobs/job_close_complete/#{params[:job_id]}")
  end
  
  def edit
    
  end
  
  def update
    
  end
  
  def destroy
    
  end
  
  
  private
  
  def review_params
    params.require(:review).permit(
      :text, :nursing_home_id, :hero_id, :job_id,
      :behavior, :smile, :cleanliness, :politeness, :physical
      )
  end
end
