class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # デフォルト記述
  protect_from_forgery with: :exception

  # before_actionで下で定義したメソッドを実行
  before_action :configure_permitted_parameters, if: :devise_controller?

  # 変数PERMISSIBLE_ATTRIBUTESに配列[:name :avatar :avatar_cache]を代入
  # 新規登録とアカウント更新の際に、パラメータに含まれるようにする
  PERMISSIBLE_ATTRIBUTES = %i(name avatar avatar_cache)

  protected

  # deviseのストロングパラメーターにカラム追加するメソッドを定義
  # deviseのコントローラの場合のみ起動させる
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: PERMISSIBLE_ATTRIBUTES)
    devise_parameter_sanitizer.permit(:account_update, keys: PERMISSIBLE_ATTRIBUTES)
  end
end
