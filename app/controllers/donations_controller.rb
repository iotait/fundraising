class DonationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]

  # TODO security revisit CSRF protection here
  skip_before_action :verify_authenticity_token, only: [:create]
  def create
    Stripe.api_key = Rails.application.credentials[:stripe][Rails.env.to_sym][:secret_key]

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ["card"],
      line_items: [{
        name: "Donation",
        description: "One time donation to Bookworm.",
        amount: params[:amount].to_i * 100,
        currency: "usd",
        quantity: 1,
      }],
      success_url: "https://bookworm.com/donations/success?session_id={CHECKOUT_SESSION_ID}",
      cancel_url: "https://example.com/cancel",
    )

    donor = params[:donor]
    amount = params[:amount]
    message = params[:message]
    status = "pending"
    session_id = @session.id
    if params[:student_id]
      donatable_type = "User"
      donatable_id = params[:student_id]
    else
      donatable_type = "School"
      donatable_id = params[:school_id]
    end

    Donation.create!(donor: donor, amount: amount, message: message, donatable_type: donatable_type, donatable_id: donatable_id, status: status, session_id: session_id)

    render json: {session_id: @session.id}
  end
end
