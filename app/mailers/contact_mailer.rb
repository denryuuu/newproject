class ContactMailer < ApplicationMailer
    default to: 'ebcapp-support@misapri.com' # 受信するメールアドレスに変更してください

    def send_contact_email
      @contact = params[:contact]
      mail(
        subject: 'お問い合わせが届きました',
        from: ENV['MAIL_FROM'], # 認証済みのメールアドレス
        reply_to: @contact.email
      )
    end
end
