class HerosController < ApplicationController
before_action :authenticate_hero!, only: [:show]

  def show
    @hero = Hero.find(params[:id])
  end
  
  def follow
    @hero = Hero.find(params[:hero_id])
    current_hero.follow(@hero)
    redirect_to hero_path(@hero)
  end
  
  def unfollow
    @hero = Hero.find(params[:hero_id])
    current_hero.stop_following(@hero)
    redirect_to hero_path(@hero)
  end
  
  def follow_list
    @hero = Hero.find(params[:hero_id])
  end
  
  def follower_list
    @hero = Hero.find(params[:hero_id])
  end
end
