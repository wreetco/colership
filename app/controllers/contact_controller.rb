class ContactController < ApplicationController
  protect_from_forgery with: :null_session

  def index
  end

  def new
    # add a new contact form, we don't care what one, it all get's iteremailed
    ContactMailer.send_contact(params[:contact]).deliver
  end # end new method

end
