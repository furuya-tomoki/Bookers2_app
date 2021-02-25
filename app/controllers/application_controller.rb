class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about]
  # ログイン認証が成功していないと、トップページ以外の画面を表示できない
  before_action :configure_permitted_parameters, if: :devise_controller?
  # ↑自動追加 configure_permitted_parametersが実行される

  protected

  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

  # 実行内容 エラーありイレギュラー表記
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    # ここでサインアップ時にnameカラムに値を登録することを許可する。
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    # ここでアカウント情報更新時にnameカラムの値を更新することを許可する。
  end
end
