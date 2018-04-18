if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_mUCoffdaEweZHa98jIGdYzNT',
    secret_key: 'sk_test_ylcNOUIqgcEW2l5t1MJXW8fX'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]