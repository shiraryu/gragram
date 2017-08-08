class Picture < ApplicationRecord
  validates:content,presence:true,length:{maximum: 350}
  validates:pictureimage,presence:true

  mount_uploader:pictureimage,PictureUploader  # carrierwave用の設定(modelとアップローダーの紐付け)

  belongs_to :user,optional: true    #Rails5系を使用する時はoptional:trueというコードが必要。（投稿時にuserに関するエラーが出る）
end
