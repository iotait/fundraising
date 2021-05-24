source "https://rubygems.org"
ruby "3.0.1"

gem "rails", ">= 6.0.1"
gem "sass-rails"
gem "uglifier"
gem "coffee-rails"
gem "jquery-rails"
gem "turbolinks"
gem "bootsnap", require: false
gem "webpacker"
gem "puma"
gem "devise"
gem "bootstrap"
gem "font-awesome-sass"
gem "wicked_pdf", "~> 1.1"
gem "wkhtmltopdf-binary"
gem "stripe"
gem "stripe_event"
gem "aws-sdk-s3", require: false
gem "fuzzy_match", require: false

group :development do
  gem "listen"
  gem "spring"
end

group :development, :test do
  gem "pry"
  gem "pry-byebug"
  gem "launchy"
  gem "rspec-rails"
  gem "guard-rspec", require: false
  gem "standard"
  gem "sqlite3"
end

group :test do
  gem "capybara"
  gem "shoulda-matchers"
  gem "factory_bot_rails"
end

group :production do
  gem "pg"
end
