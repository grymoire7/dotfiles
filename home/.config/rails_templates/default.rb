gem_group :development, :test do
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'faker'
end

initializer 'generators.rb', <<-CODE
  Rails.application.config.generators do |g|
    g.test_framework :rspec,
      fixtures: false,
      routing_specs: false,
      helper_specs: false
    g.fixture_replacement :factory_bot, dir: 'spec/factories'
  end
CODE

after_bundle do
  generate 'rspec:install'
end
