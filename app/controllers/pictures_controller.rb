class PicturesController < ApplicationController
  before_action :authenticate_user!        #ログイン有無のチェック
  before_action :set_picture,only:[:edit,:update,:destroy]

  def index
    @pictures = Picture.all
  end

  def new
    if params[:back]
      @picture = Picture.new(pictures_params)
    else
      @picture = Picture.new
    end
  end

  def create
    @picture = Picture.new(pictures_params)
    @picture.user_id = current_user.id      #contentと一緒にuser_idも保存されるようにする*/
      if @picture.save
        redirect_to pictures_path,notice:"投稿しました"
        NoticeMailer.sendmail_picture(@picture).deliver      #Mailer呼び出し
      else
        render'new'
      end
  end

  def edit
  end

  def update
    if @picture.update(pictures_params)
      @picture.update(pictures_params)
    else
      render'edit'
    end
    redirect_to pictures_path,notice:"編集しました"
  end

  def destroy
    @picture.destroy
    redirect_to pictures_path,notice:"削除しました"
  end

  def confirm
    @picture = Picture.new(pictures_params)
    render :new if @picture.invalid?
  end

  private
    def pictures_params
      params.require(:picture).permit(:content)
    end
    # idをキーとして取得するメソッド
    def set_picture
      @picture = Picture.find(params[:id])
    end

end
