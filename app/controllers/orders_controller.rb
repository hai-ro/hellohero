class OrdersController < ApplicationController
  def edit
    @job = Job.find(params[:id])
  end
  
  def update
    @job = Job.find(params[:id])
    Job.update(order_params)
  end
  
  
  private
  def endorder_params
    params.require(:job).permit(:progress, :hero_id)
  end
end
