class HomeController < ApplicationController
  skip_before_action :login_required

#before_action :unforce_ssl
  
  def index
  #puts  form_authenticity_token
  end
	def return_auth_token_baby
	puts form_authenticity_token
   redirect_to ("https://127.0.0.1/cis-broker/index.php?mytoken=#{form_authenticity_token}")
  end
  
end
