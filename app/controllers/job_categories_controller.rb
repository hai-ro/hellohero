class JobCategoriesController < ApplicationController
  before_action :authenticate_nursing_home!
  def new
    @job_category = JobCategory.new
  end
  
  def create
    JobCategory.create(job_category_params)
  end
  
  def destroy
  
  end
  
  private
  def job_category_params
    params.require(:job_category).permit(:name)
  end
end
