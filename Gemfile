source "https://rubygems.org"
ruby "2.3.1"

# Rails
gem "rails", ">= 5.0"
gem "sqlite3"
gem "puma"
gem "sass-rails"
gem "uglifier"
gem "turbolinks"
gem "jbuilder"

# Neo4j driver
gem "neo4j", ">= 7.2.0"

# RabbitMQ
gem "bunny", ">= 2.3.1"

group :development, :test do
  gem "byebug", platform: :mri
  gem "rspec-rails"
end

group :development do
  gem "web-console"
  gem "listen", "~> 3.0.5"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
