class NursingHomesController < ApplicationController
before_action :authenticate_nursing_home!, only: [:show]

  def show
   @nursing_home = NursingHome.find(params[:id]) 
  end
  
end