source 'https://rubygems.org'

gem 'rails', '3.2.0'
gem 'mysql2', '>=0.3.7'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

#JS Gems
gem 'jquery-rails'
gem 'therubyracer'
gem 'execjs'

#Authentication
gem 'devise', :git =>'git://github.com/plataformatec/devise.git'

#Images
gem 'rack-cache', :require => 'rack/cache'
gem 'dragonfly', '~>0.9.10'
gem 'dragonfly-minimagick'

#TextEditor
gem 'imperavi-rails', '0.0.12.beta'

#Deploy
group :development do
  gem 'capistrano', '2.9.0'
end

group :production do
  gem 'unicorn', '4.1.1'
end