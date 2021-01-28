class NursingHomesController < ApplicationController
before_action :authenticate_nursing_home!, only: [:show]

  def show
   @nursing_home = NursingHome.includes(:jobs, :clients).find(params[:id])
   @jobs = Job.where(progress: 0).includes([:hero, nursing_home: :client])
  end
  
end