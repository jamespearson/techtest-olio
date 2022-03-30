source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'rails', '~> 5.2.3'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'jbuilder', '~> 2.5'
gem 'puma', '~> 4.3'
gem 'sass-rails', '~> 5.0'
gem 'sqlite3'
gem 'turbolinks'

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails'
  gem 'rails-controller-testing'
  gem 'rspec-rails', '~> 3.8'
  gem 'shoulda'
  gem 'shoulda-matchers'
end

group :test do
  gem 'database_cleaner'
  gem 'webmock'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
