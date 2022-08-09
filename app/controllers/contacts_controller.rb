class ContactsController < ApplicationController
    def new
        @contact = Contact.new
    end

    def create
        @contact = Contact.new(params[:contact])
        @contact.request = request

        puts "=========================================="
        puts @contact
        puts "=========================================="

        if @contact.deliver
            # render json: @contact
        else
            # render json: @contact.errors, status: :unprocessable_entity
        end
    end
end
