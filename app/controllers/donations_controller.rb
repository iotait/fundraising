class DonationsController < ApplicationController
  before_action :set_donation, only: [:show]

  # GET /donations
  def index
    @donations = Donation.all
  end

  # GET /donations/1
  def show
  end

  # GET /donations/new
  def new
    @donation = Donation.new
  end

  # POST /donations
  def create
    Donation.create(donation_params)
    redirect_to donations_path
  end

  private

  def set_donation
    @donation = Donation.find(params[:id])
  end

  def donation_params
    params.require(:donation).permit(:student_id, :amount, :donor, :message)
  end
end
