require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ManyoExam
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    config.generators do |g|
      # この二行の記述で自動生成しない設定を作成しています。
      g.assets false
      g.helper false
      g.test_framework :rspec,
                        model_specs: true,
                        view_specs: false,
                        helper_specs: false,
                        routing_specs: false,
                        controller_specs: false,
                        request_specs: false
        # 言語ファイルを階層ごとに設定するための記述
        config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]

        # アプリケーションが対応している言語のホワイトリスト(ja = 日本語, en = 英語)
        config.i18n.available_locales = %i(ja en)
    
        # 上記の対応言語以外の言語が指定された場合、エラーとするかの設定
        config.i18n.enforce_available_locales = true
    
        # デフォルトの言語設定
        # config.i18n.default_locale = :en
        config.i18n.default_locale = :ja

        config.time_zone = 'Tokyo'
        config.active_record.default_timezone = :local
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
