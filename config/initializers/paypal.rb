if Rails.env.production?
  PAYPAL_CONFIG = { :partner => 'Paypal',
    :currency => 'USD',
    :payflow_url => 'https://payflowpro.paypal.com',
    :gateway => "https://payflowlink.paypal.com" }
else
  PAYPAL_CONFIG = { :mode => 'test',
    :partner => 'Paypal',
    :currency => 'USD',
    :payflow_url => 'https://pilot-payflowpro.paypal.com',
    :gateway => "https://payflowlink.paypal.com" }
end
