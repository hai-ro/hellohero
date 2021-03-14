class TopsController < ApplicationController
  def index
    if hero_signed_in? || nursing_home_signed_in?
      if hero_signed_in?
        redirect_to hero_path(current_hero.id)
      elsif nursing_home_signed_in?
        redirect_to nursing_home_path(current_nursing_home.id)
      end
    end
      @jobs = Job.includes(:nursing_home, :hero, :job_category).order("updated_at DESC").where(progress: 0)
  end
end
