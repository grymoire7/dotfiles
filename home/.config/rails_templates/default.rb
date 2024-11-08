# This is my default template for new Rails apps.
# I am generally using Rails 7.2+ with Ruby 3.2+ with this file.
# 
# It includes RSpec, FactoryBot, and Faker for testing.
# It uses bootstrap for the CSS framework.
# It uses PostgreSQL for the database.
# It includes a generator configuration for RSpec and FactoryBot.
# It also includes Devise for user authentication if you want it.
#
# I also have a shell function that wraps the `rails new` command and
# references this template.
#
#  rails_new () {
#    if [[ $# -eq 0 ]]
#    then
#      echo "Usage: rails_new <app_name> <options>"
#      echo "rails new \"\$@\" --css=bootstrap -T -d postgresql -m \$XDG_CONFIG_HOME/rails_templates/default.rb"
#      return 1
#    fi
#    rails new "$@" --css=bootstrap -T -d postgresql -m $XDG_CONFIG_HOME/rails_templates/default.rb
#  }

def add_gems
  gem_group :development, :test do
    gem 'rspec-rails'
    gem 'factory_bot_rails'
    gem 'faker'
  end
  
  gem 'devise' if @using_devise
end

def get_user_input
  @using_devise = yes?("Do you want to add Devise for user authentication?")
end

def add_rspec_config
  initializer 'generators.rb', <<-CODE
    Rails.application.config.generators do |g|
      g.test_framework :rspec,
        fixtures: false,
        routing_specs: false,
        model_specs: false,
        helper_specs: false
      g.fixture_replacement :factory_bot, dir: 'spec/factories'
    end
  CODE
end

def add_devise = generate 'devise:install'
def add_rspec  = generate 'rspec:install'

# main setup
get_user_input
add_gems
after_bundle do
  add_devise if @using_devise
  add_rspec
  add_rspec_config

  # prepare the database
  rails_command 'db:drop db:create db:migrate db:test:prepare'

  git :init
  git add: '.'
  git commit: %Q{ -m 'Initialize repository' }
  
  say
  say 'Your Rails app is ready to go!', :green
  say
  say 'Next steps:'
  say "  $ cd #{app_name} && ./bin/dev", :yellow
  say
end
