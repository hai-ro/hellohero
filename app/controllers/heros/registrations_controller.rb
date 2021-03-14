# frozen_string_literal: true

class Heros::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    super
  end

  # GET /resource/edit
  def edit
    super
  end

  # PUT /resource
  def update
    super
  end

  # DELETE /resource
  def destroy
    super
  end
  
  # 資格情報の承認のために追加
  def confirmation
    super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :gender, :birthday,:initial_training, :practical_training, :social_worker, :care_manager, :care_worker, :mhwp, :csdw, :interventional_services, :wehc, :dementia_care, :confirmation, :performance])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :gender, :address, :special_skill, :birthday, :profile, :like, :initial_training, :practical_training, :social_worker, :care_manager, :care_worker, :mhwp, :csdw, :interventional_services, :wehc, :dementia_care, :confirmation, :performance])
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    hero_path(resource)
  end

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    super(resource)
  end
  
  # ユーザーの情報更新後にマイページへ遷移
  def after_update_path_for(resource)
    "/heros/profile/#{resource.id}"
  end
end
