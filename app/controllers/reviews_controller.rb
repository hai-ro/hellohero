class ReviewsController < ApplicationController
  def index
    
  end
  
  def show
    
  end
  
  def new
    @review = Review.new
    @job = Job.includes(:nursing_home, :hero).find(params[:job_id])
  end
  
  def create
    
  end
  
  def edit
    
  end
  
  def update
    
  end
  
  def destroy
    
  end
end
