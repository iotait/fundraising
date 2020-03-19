class DonationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create], raise: false

  # TODO security revisit CSRF protection here
  skip_before_action :verify_authenticity_token, only: [:create], raise: false
  def create
    Stripe.api_key = Rails.application.credentials[:stripe][Rails.env.to_sym][:secret_key]

    #Set success and cancel url
    success_url = params[:student_id] ? ("http://localhost:3000/students/" + params[:student_id] + "/donations/success")
                                      : ("http://localhost:3000/schools/" + params[:school_id] + "/donations/success")
    cancel_url = params[:student_id] ? ("http://localhost:3000/students/" + params[:student_id] + "/donations/cancel")
                                     : ("http://localhost:3000/schools/" + params[:school_id] + "/donations/cancel")

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ["card"],
      line_items: [{
        name: "Donation",
        description: "One time donation to Bookworm.",
        amount: params[:amount].to_i * 100,
        currency: "usd",
        quantity: 1,
      }],
      success_url: success_url,
      cancel_url: cancel_url,
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
