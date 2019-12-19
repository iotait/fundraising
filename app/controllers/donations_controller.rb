class DonationsController < ApplicationController
  # GET /donations/new
  def new
    @donation = Donation.new
    @donation.donatable_id = params[:id]
    @donation.donatable_type = params[:type]
  end

  # POST /donations
  def create
    Donation.create(donation_params)
    redirect_to "/"
  end

  private

  def donation_params
    params.require(:donation).permit(:donatable_type, :donatable_id, :amount, :donor, :message)
  end
end
