class RegistrationsController < Devise::RegistrationsController

  private
  
  def after_sign_up_path_for(resource)
    browse_posts_path
  end
  
  def sign_up_params
    params.require(:user).permit(:email, :user_name, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:email, :user_name, :password, :password_confirmation, :current_password)
  end
end