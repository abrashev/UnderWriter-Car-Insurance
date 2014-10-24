require 'net/http'
require 'uri'
class SessionsController < ApplicationController
# force_ssl except: [:destroy]

  skip_before_action :login_required

  # GET /session/new
  def new
  end

   
  
  #post to my broker app
  def newpost
  
  uri = URI.parse("https://127.0.0.1/cis-broker/test.php")
	http = Net::HTTP.new(uri.host, uri.port)
	http.use_ssl = true
	http.verify_mode = OpenSSL::SSL::VERIFY_NONE
request = Net::HTTP::Post.new(uri.request_uri)
request.set_form_data({"php_username" => "username is some", "token" => "tokenxaxa"})

#request.add_field("Accept", "application/json")
#request.add_field("Content-Type", "application/x-www-form-urlencoded")
response = http.request(request)
puts response.header
#redirect_to ('http://127.0.0.1/cis-broker/main.php')
  end
  
  
  #login
  def userlogin
  user_detail = UserDetail.authenticate(params[:email], params[:password])
  
    if user_detail
	self.current_user = user_detail
	respond_to  do |format|
	@anuser=UserDetail.find_by_email(params[:email])
		format.json{ @anuser}#@anuser=UserDetail.find_by_email(params[:email])}
	end
		 
	else
	respond_to  do |format|
		format.json{ render json: "null"}##@anuser, status: :unprocessable_entity}
		end
		
	end
  end
  
  # POST /session
  def create 
  	
	 user_detail = UserDetail.authenticate(params[:email], params[:password])
    if user_detail
      self.current_user = user_detail
	   
      uri = session[:original_uri]
      session[:original_uri] = nil
	  
	   flash[:notice] = I18n.t('sessions.login-success')
	  redirect_to (uri || home_url)
	  
    else
      flash[:error] = I18n.t('sessions.login-failure') + " #{params[:email]}"
	
       redirect_to new_session_url
	  
	   
    end
	 
  end

  #DELETE /session
  def destroy
	
    session[:user_id] = nil
	flash[:notice] = 'Logged out successfully'
    redirect_to home_path
	# redirect_to ('https://127.0.0.1/cis-broker/logout.php')
  end

  
end
