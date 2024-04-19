source "https://rubygems.org"

ruby "3.3.0"

# Rails framework
gem "rails", "~> 7.1.3", ">= 7.1.3.2"
gem "puma", ">= 5.0"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false

# Frontend
gem "sprockets-rails"
gem "jsbundling-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "cssbundling-rails"
gem "font-awesome-rails"

# Database
gem "mysql2", "~> 0.5.3"

# Active Storage
gem "image_processing", "~> 1.2"
gem "mini_magick"
gem "aws-sdk-s3", require: false
gem "active_storage_validations"

# OpenAI API
gem "ruby-openai"

# Pagination
gem "kaminari"

# Searching
gem "ransack", "~> 3.1.0"

group :development, :test do
  gem "pry-rails"
  gem "rubocop", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-rspec", require: false
  gem "pry-byebug"
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
