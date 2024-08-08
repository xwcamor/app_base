source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.0"

# Gema RAILS
gem "rails", "~> 7.0.8", ">= 7.0.8.4"

# Gema de JQUERY
gem "jquery-rails"

# Gema para autenticar
gem "devise"

# Gema MYSQL
gem 'mysql2'

# Gema para manejar variables de entorno
gem 'dotenv-rails', groups: [:development, :test]

# Gema para perfiles
gem "cancancan", "~> 3.3"

# Para agregar filas en una tabla nested
gem 'cocoon'

# Gema para los gráficos del dashboard
gem 'chartkick' # Gema para grafico
gem 'groupdate' # Gema para agrupar datos

# GEM FOR ALERTS ON CONTROLLER
gem 'sweetify'

gem 'active_link_to'

gem 'ransack'

gem 'kaminari'

gem 'carrierwave'


#gem 'axlsx_rails'
gem 'caxlsx_rails'
 

#gem 'will_paginate'

# Turbo Links Rails
#gem "turbo-rails"

# Gema de validación en el cliente
#gem "parsley"

# Gema SQLITE (comentada si no se usa)
#gem "sqlite3", "~> 1.4"

gem "sprockets-rails"
gem "bootstrap", "~> 5.1.3"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem "stimulus-rails"
gem "jbuilder"

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end