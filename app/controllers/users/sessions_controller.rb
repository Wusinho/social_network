# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  after_action :update_sign_in_status, only: [:create]
  before_action :update_sign_in_status, only: [:destroy]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  def update_sign_in_status
    current_user.update_attribute(:is_signed_in, !current_user.is_signed_in )
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
