source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.2"

gem "mysql2", "~> 0.5"
gem "puma", "~> 5.0"
gem "rails", "~> 6.1.4", ">= 6.1.4.1"
gem "sass-rails", ">= 6"
gem "simple_form"
gem "slim"

gem "friendly_id", "~> 5.4.0"
gem "gretel"
gem "jbuilder", "~> 2.7"
gem "webpacker", "~> 5.0"

gem "bootsnap", ">= 1.4.4", require: false

group :development, :test do
  gem "pry", "0.13.1"
  gem "pry-rails"
  gem "rubocop", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
end

group :development do
  gem "listen", "~> 3.3"
  gem "rack-mini-profiler", "~> 2.0"
  gem "spring"
  gem "web-console", ">= 4.1.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
