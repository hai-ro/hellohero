class NursingHomesController < ApplicationController
before_action :authenticate_nursing_home!, only: [:show]

  def show
   @nursing_home = NursingHome.includes(:jobs).find(params[:id])
   @jobs = Job.where(progress: 0).includes(:hero)
  end
  
end