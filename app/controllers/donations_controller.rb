class DonationsController < ApplicationController
  def index
    @donations = Donation.all
    render :index
  end

  def new
    @donation = Donation.new
    render :new
  end

  def create
    Donation.create(donation_params)
    redirect_to donations_path
  end

  private

  def donation_params
    params.require(:donation).permit(:student_id, :amount, :donor, :message)
  end
end
