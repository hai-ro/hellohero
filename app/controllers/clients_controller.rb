class ClientsController < ApplicationController
  before_action :authenticate_nursing_home!, except: [:show]
  
  def index
    @clients = Client.where(nursing_home_id: current_nursing_home.id)
  end
  
  def show
    @client = Client.find(params[:id])
  end
  
  def new
    @client = Client.new
    @nursing_home = NursingHome.find(current_nursing_home.id)
  end
  
  def create
    Client.create(client_params)
  end
  
  def edit
    
  end
  
  def update
    
  end
  
  def destroy
    
  end
  
  private
  def client_params
    params.require(:client).permit(:name, :birthday, :gender, :disability, :like, :bad, :image, :area, :profile, :nursing_home_id)
  end
end
