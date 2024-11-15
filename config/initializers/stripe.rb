Rails.configuration.stripe = {
  # publishable_key: Rails.application.secrets.stripe_publishable_key,
  # secret_key:  Rails.application.secrets.stripe_secret_key
  publishable_key: ENV["STRIPE_PUBLISHABLE_KEY"],
  secret_key: ENV["STRIPE_SECRET_KEY"]
}
Stripe.api_key = Rails.configuration.stripe[:secret_key]
