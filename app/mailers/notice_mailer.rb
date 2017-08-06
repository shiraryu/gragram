class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_picture.subject
  #
  #引数としてpicture追加
  def sendmail_picture(picture)
    @greeting = "Hi"
      @picture = picture

      mail to: "@picture.email",
        subject:'[Gragram]Pictureが投稿されました'
  end
end
