class HomeController < ApplicationController
  def index
  end


  def subscribe
    if ! params[:email][:address].blank?
      begin
        #todo add exception later on
        @gb.lists.subscribe({:id => ENV["MAILCHIMP_LIST_ID"] ,
                             :email => {:email => params[:email][:address]},
                             :double_optin => false})
        respond_to do |format|
          # format.html { redirect_to root_url, :notice => 'successfully subcscribed  to the list' }
          format.json{
          render :json => {:message => " Thank you for your interest in our beta program. You will receive an email when your account is ready. You are now on our VIP list."}
        }
        end
      rescue Gibbon::MailChimpError => e
        respond_to do |format|
          # format.html {redirect_to root_url, :alert => e.message } 
        format.json{
          render :json => {:message => e.message}
        }
        end
      end
    else

    end
  end
end
