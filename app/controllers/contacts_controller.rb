class ContactsController < ApplicationController
    def new
      @contact = Contact.new
    end
    
    def create
      @contact = Contact.new(contact_params)
    
      if @contact.valid?
        # メール送信処理
        ContactMailer.with(contact: @contact).send_contact_email.deliver_now
          flash[:notice] = "お問い合わせを送信しました。"
          redirect_to new_contact_path
      else
        flash.now[:alert] = "入力内容にエラーがあります。"
        render :new
      end
    end
    
      private
    
      def contact_params
        params.require(:contact).permit(:name, :email, :message)
      end
end
