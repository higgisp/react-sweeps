require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
# require "action_mailer/railtie"
# require "action_view/railtie"
# require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

if defined?(Dotenv)
  Dotenv.load
end

module Sweeps
  class Application < Rails::Application
    config.title = ENV['APP_TITLE']
    config.company_name = ENV['COMPANY_NAME']
    config.job_number = ENV['JOB_NUMBER']
    config.promotion_start = DateTime.parse(ENV['PROMOTION_START']) if ENV['PROMOTION_START']
    config.promotion_end = DateTime.parse(ENV['PROMOTION_END']) if ENV['PROMOTION_START']
    config.facebook_title = ENV['FACEBOOK_TITLE']
    config.facebook_description = ENV['FACEBOOK_DESCRIPTION']
    config.facebook_title = ENV['FACEBOOK_TITLE']
    config.twitter_description = ENV['TWITTER_DESCRIPTION']
    config.email_subject = ENV['EMAIL_SUBJECT']
    config.email_description = ENV['EMAIL_DESCRIPTION']
    config.facebook_app_id = ENV['FACEBOOK_APP_ID']
    config.open_house = ENV['OPEN_HOUSE']
    config.site_url = ENV['SITE_URL']
    config.s3_bucket = ENV['S3_BUCKET']
    config.google_analytics_id = ENV['GOOGLE_ANALYTICS_ID']
    config.time_zone = 'Central Time (US & Canada)'
    config.secret_key_base = ENV['SECRET_KEY_BASE']
    config.active_record.raise_in_transactional_callbacks = true
  end
end
