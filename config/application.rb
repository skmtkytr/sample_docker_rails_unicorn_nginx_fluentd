require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module EFriends
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.time_zone = 'Tokyo'

    # デフォルトではどのヘルパーファイルにヘルパーメソッドを記述してもアプリケーション全体で使用できてしまう
    # アプリケーションが肥大化した場合名前の競合が意図せず起きてしまうことも考えられるため
    # Do not share helper methods
    config.action_controller.include_all_helpers = false

    config.generators do |g|
      g.assets false
      g.helper false
      g.template_engine = :slim
      g.test_framework :rspec, view_specs: false, routing_specs: false
    end
  end
end
