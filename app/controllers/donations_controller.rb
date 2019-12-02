class DonationsController < ApplicationController
  # GET /donations/new
  def new
    @donation = Donation.new
  end

  # POST /donations
  def create
    Donation.create(donation_params)
    redirect_to "/"
  end

  private

  def donation_params
    params.require(:donation).permit(:student_id, :amount, :donor, :message)
  end
end
