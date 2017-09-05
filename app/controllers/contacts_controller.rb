class ContactsController < ApplicationController
  def index
    @contacts = current_user.contacts
    @new_contact = Contact.new
    @new_contact.phones.build
  end
  def create
    contact = Contact.new(strong_params)
    contact.user_id = current_user.id
    if contact.save
      flash[:Successfully] = "Başarılı bir şekilde oluşturuldu..."
      redirect_to contact
    else
      flash[:error] = "Hata oluştu..."
      redirect_to root_path
    end
  end
  def show
    @contact = Contact.find(params[:id])
    @contacts = current_user.contacts
    @new_contact = Contact.new
    @new_contact.phones.build
  end
  private
  def strong_params
    params.require(:contact).permit(:name, :surname, :birthday, :address, :city, :country, :email, :website, :company, :job, :gender, :race, :avatar, :phones_attributes => [:phone])
  end
end
