class ApplicationController < ActionController::Base
  before_action :authenticate_user!,only:[:new,:edit,:destroy]
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile, :occupation, :position])
  #下記はメッセージテーブルを作成する際に記述しました。km
   # params.require(:message).permit(:content, :image).merge(user_id: current_user.id)  
  
  end

end