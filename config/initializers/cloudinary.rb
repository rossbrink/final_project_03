Cloudinary.config do |config|
  config.cloud_name = ENV["CLOUDINARY_NAME"]
  config.api_key = ENV["CLOUDINARY_TOKEN"]
  config.api_secret = ENV["CLOUDINARY_SECRET"]
  config.cdn_subdomain = true
end