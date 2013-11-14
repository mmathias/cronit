source 'https://rubygems.org'
ruby '2.0.0'

gem 'rails', '4.0.0.rc2'
gem 'bootstrap-sass', '2.3.1.0'
gem 'bcrypt-ruby', '3.0.1'
gem 'faker', '1.1.2'
gem 'will_paginate', '3.0.4'
gem 'bootstrap-will_paginate', '0.0.9'
gem 'json'
gem 'whenever', :require => false

group :development, :test do
  gem 'sqlite3', '1.3.7'
  gem 'rspec-rails', '2.13.1'
  gem 'guard-rspec', '2.5.0'

  gem 'spork-rails', github: 'railstutorial/spork-rails'
  gem 'guard-spork', '1.5.0'
  gem 'childprocess', '0.3.6'
  gem 'mysql'
  gem 'factory_girl_rails', '4.2.1'
end

group :test do
  gem 'selenium-webdriver', '~> 2.35.1'
  gem 'capybara', '2.1.0'

  # Uncomment these lines on OS X.
  gem 'rb-fsevent', '0.9.3', :require => false
  gem 'growl', '1.0.3'
  gem 'cucumber-rails', '1.3.0', :require => false
  gem 'database_cleaner', '~> 1.0.0.RC1'

end

gem 'sass-rails', '4.0.0.rc1'
gem 'uglifier', '2.1.1'
gem 'jquery-rails', '2.2.1'
gem 'turbolinks', '1.1.1'
gem 'jbuilder', '1.0.2'

group :doc do
  gem 'sdoc', '0.3.20', require: false
end

group :production do
  gem 'pg', '0.15.1'
end