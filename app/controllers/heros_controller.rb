class HerosController < ApplicationController
  before_action :authenticate_hero!, only: [:show]

  def show
    @hero = Hero.includes(:jobs).find(params[:id])
    @jobs = Job.where(progress: 0).includes([:hero, nursing_home: :client])
  end
  
  # フォロー機能を実装するときに要検討（現在未実装）
  # def follow
  #   @hero = Hero.find(params[:hero_id])
  #   current_hero.follow(@hero)
  #   redirect_to hero_path(@hero)
  # end
  
  # def unfollow
  #   @hero = Hero.find(params[:hero_id])
  #   current_hero.stop_following(@hero)
  #   redirect_to hero_path(@hero)
  # end
  
  # def follow_list
  #   @hero = Hero.find(params[:hero_id])
  # end
  
  # def follower_list
  #   @hero = Hero.find(params[:hero_id])
  # end
end
