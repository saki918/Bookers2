class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  #  ログイン・ログアウト時のリダイレクト先の変更
  
  def after_sign_in_path_for(resource)
  user_path(current_user.id)
  end
  # def after_sign_out_path_for(resource)
  # new_user_path
  # end

  # ⬇︎コントローラのprivateと同じ意味
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end
 
end
