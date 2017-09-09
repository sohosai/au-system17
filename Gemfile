source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby "2.3.4"
gem "cancancan"
gem "config"
gem "devise"
gem "enum_help"
gem "jquery-rails"
gem "non-stupid-digest-assets"
gem "pg", "~> 0.18"
gem "puma", "~> 3.7"
gem "rails", "~> 5.1.3"
gem "rails_admin"
gem "ransack"
gem "sass-rails", "~> 5.0"
gem "slim-rails"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "capybara", "~> 2.13"
  gem "selenium-webdriver"
end

group :development do
  gem "brakeman", require: false
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "onkcop", require: false
  gem "pry-rails"
  gem "rubocop", require: false
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "sqlite3"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
