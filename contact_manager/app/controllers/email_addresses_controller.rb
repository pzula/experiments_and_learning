class EmailAddressesController < ApplicationController
  before_action :find_resource, only: [:edit, :update, :destroy]


  # GET /email_addresses/new
  def new
    @email_address = EmailAddress.new(contact_id: params[:contact_id], contact_type: params[:contact_type])
  end

  # POST /email_addresses
  # POST /email_addresses.json
  def create
    @email_address = EmailAddress.new(email_address_params)

    respond_to do |format|
      if @email_address.save
        format.html { redirect_to @email_address.contact, notice: 'Email address was successfully created.' }
      else
        format.html { render action: 'new' }
        format.json { render json: @email_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /email_addresses/1
  # PATCH/PUT /email_addresses/1.json
  def update
    respond_to do |format|
      if @email_address.update(email_address_params)
        format.html { redirect_to @email_address.contact, notice: 'Email address was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @email_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /email_addresses/1
  # DELETE /email_addresses/1.json
  def destroy
    @email_address.destroy
    respond_to do |format|
      format.html { redirect_to @email_address.contact }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def email_address_params
      params.require(:email_address).permit(:email, :contact_id, :contact_type)
    end
end