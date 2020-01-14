Stripe.api_key = Rails.application.credentials[:stripe][Rails.env.to_sym][:secret_key]
StripeEvent.signing_secret = Rails.application.credentials[:stripe][Rails.env.to_sym][:signing_secret]

# Causes a depracation warning
StripeEvent.configure do |events|
  events.subscribe "checkout.session.completed", SuccessfulCharge.new
end
