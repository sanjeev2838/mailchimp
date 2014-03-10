class HomeController < ApplicationController
  def index
  end


  def subscribe
    if ! params[:email][:address].blank?
      begin
        #todo add exception later on
        @gb.lists.subscribe({:id => '696cd3b1d1' ,
                             :email => {:email => params[:email][:address]},
                             :double_optin => false})
        redirect_to root_url, :notice => 'successfully subcscribed  to the list'
      rescue Gibbon::MailChimpError => e
        redirect_to root_url, :alert => e.message
      end
    else

    end
  end
end
