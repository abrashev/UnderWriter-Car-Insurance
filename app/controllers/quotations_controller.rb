class QuotationsController < ApplicationController

 #force_ssl  except: [:destroy]

  before_action :set_quotation, only: [:show,:destroy]
  before_action :set_current_page, except: [:index]
  before_action :admin_required, only: [:index,:destroy]
  before_action :login_required, only: [:new,:search]
  rescue_from ActiveRecord::RecordNotFound, with: :show_record_not_found
 
  # GET /quotations
  # GET /quotations.json
  def index
    #@quotations = Quotation.all
	@quotations = Quotation.paginate page: params[:page],per_page: 3,order: 'id DESC'#params[:per_page]
	 
  end



def search
    # Use will_paginate's :conditions and :joins to search across both the
    # users and user_details tables. search_fields private method will add a field
    # for each checkbox field checked by the user, or returns nil
    # if none were checked. The search_conditions method is defined
    # in lib/searchable.rb and either searches across all columns identified in
    # User.searchable_by or uses the search_fields to constrain the search
	 @quotations = Quotation.where(identification: params[:q])
    respond_to do |format|
      format.html {
         @quotation = Quotation.where(identification: params[:q])
		 
      }
      # Deal with incoming Ajax request for JSON data for autocomplete search field
      format.json {
	   if !(@quotations.length==0 || current_user.id == @quotations[0].user_id)
			 render json: "[]"#indicate_illegal_request I18n.t('users.not-your-account')
		else
		@quotations
		end
      }
	  
    end
	
	
	
  end
  
  def search_fields(table)
    fields = []
    table.search_columns.each do |column|
      # The parameters have had the table name stripped off so we
      # have to to the same to each search_columns column
      fields << column if params[column.sub(/^.*\./, "")]
    end
    fields = nil unless fields.length > 0
    fields
  end
  
  # GET /quotations/1
  # GET /quotations/1.json
  def show
  
  if (current_user.id == @quotation.user_id) || is_admin?
      respond_to do |format|
	 #@vehicle=Vehicle.find_by_quotation_id(@quotation.id)
	 @myincidents=Incident.where(user_id: current_user.id).count
        format.html # show.html.erb
        format.json # show.json.builder
      end
    else
	
     indicate_illegal_request I18n.t('users.not-your-account')
	 
    end
  end

  
  # GET /quotations/new
  def new
    @quotation = Quotation.new
	@quotation.vehicle = Vehicle.new
	
  end

  # GET /quotations/1/edit
  def edit
  end

  # POST /quotations
  # POST /quotations.json
  def create
    @quotation = Quotation.new(quotation_params)
	if(@quotation.user_id==nil) 
	@quotation.user_id=current_user.id
	end
	#puts  @myincidents
    respond_to do |format|
      if @quotation.save
        format.html { redirect_to @quotation, notice: 'Quotation was successfully created. Please Remember Your Identification number for later retrieve!' }
        format.json { render action: 'show', status: :created, location: @quotation }
      else
        format.html { render action: 'new' }
        format.json { render json: @quotation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quotations/1
  # PATCH/PUT /quotations/1.json
  def update
    respond_to do |format|
      if @quotation.update(quotation_params)
        format.html { redirect_to @quotation, notice: 'Quotation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @quotation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quotations/1
  # DELETE /quotations/1.json
  def destroy
    @quotation.destroy
    respond_to do |format|
      format.html { redirect_to quotations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quotation
      @quotation = Quotation.find(params[:id])
	 
    end

	 def set_current_page
    @current_page = params[:page] || 1
  end
  
	  def show_record_not_found(exception)
    respond_to do |format|
      format.html {
        redirect_to(home_url(page: @current_page),
                    notice: "Quotation no longer exist")
      }
      format.json {
        render json: "{Quotation no longer exist}",
               status: :unprocessable_entity
      }
    end
  end
  
  def indicate_illegal_request(message)
    respond_to do |format|
      format.html {
        flash[:error] = message
        redirect_back_or_default(home_url)
      }
      format.json {
        render json: "{#{message}}",
               status: :unprocessable_entity
      }
    end
  end
  
    # Never trust parameters from the scary internet, only allow the white list through.
    def quotation_params
      params.require(:quotation).permit(:identification, :quotepremium,:breakdowncover,:windscreenrepair,:user_id,vehicle_attributes:[:registration,:mileage,:value,:parkinglocation,:policystart,:id])
    end
end
