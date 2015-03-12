Rails.configuration.stripe = {
  :publishable_key => "pk_test_DK65SJ6d2ayfW0mjcQdajrzc",
  :secret_key      => "sk_test_4mwLdx4BanfX0P8b2ZYd5kps"
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]