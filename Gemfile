source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby "2.3.4"
gem "cancancan", "2.0.0"
gem "config", "1.4.0"
gem "devise", "4.3.0"
gem "enum_help", "0.0.17"
gem "jquery-rails", "4.3.1"
gem "non-stupid-digest-assets", "1.0.9"
gem "pg", "0.21.0"
gem "puma", "3.10.0"
gem "rails", "5.1.4"
gem "rails_admin", "1.2.0"
gem "ransack", "1.8.3"
gem "sass-rails", "5.0.6"
gem "slim-rails", "3.1.2"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "capybara", "~> 2.13"
  gem "selenium-webdriver"
end

group :development do
  gem "brakeman", "3.7.2", require: false
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "onkcop", "0.49.1.0", require: false
  gem "pry-rails", "0.3.6"
  gem "rubocop", "0.49.1", require: false
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "sqlite3", "1.3.13"
end

gem "unicorn", group: :production

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
