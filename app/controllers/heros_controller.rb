class HerosController < ApplicationController
  before_action :authenticate_hero!, only: [:show]

  def show
    @hero = Hero.includes(:jobs, :reviews).find(params[:id])
    @jobs = Job.includes(:hero, :nursing_home).where(progress: 0)
    
    @eto = @hero.birthday.strftime('%Y').to_i % 12
    
    job_count = @hero.jobs.count
    
    if @hero.jobs.count == 0
      @behavior = 0
      @smile = 0
      @cleanliness = 0
      @politeness = 0
      @physical = 0
    else
      @behavior = @hero.reviews.sum(:behavior) / job_count.to_i
      @smile = @hero.reviews.sum(:smile) / job_count.to_i
      @cleanliness = @hero.reviews.sum(:cleanliness) / job_count.to_i
      @politeness = @hero.reviews.sum(:politeness) / job_count.to_i
      @physical = @hero.reviews.sum(:physical) / job_count.to_i
    end
    
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
