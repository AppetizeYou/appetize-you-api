class ContactsController < ApplicationController
    def new
        @contact = Contact.new
    end

    def create
        # create new contact details and submit
        @contact = Contact.new(params[:contact])
        @contact.request = request

        if @contact.deliver
            # render json: @contact
        else
            # render json: @contact.errors, status: :unprocessable_entity
        end
    end
end
