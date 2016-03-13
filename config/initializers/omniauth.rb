Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "1144239158920317", "f199282e4d0b527ec3da80b2d2a977e7"
end