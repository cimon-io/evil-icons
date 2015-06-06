require_relative "evil_icons/version"

module EvilIcons

  class << self

    def register!
      register_helpers
      register_engine     if rails?
      register_sprockets  if sprockets?
    end

    def rails?
      defined?(::Rails::Engine)
    end

    def sprockets?
      defined?(::Sprockets)
    end

    def root_dir
      File.expand_path "."
    end

    def assets_dir
      File.join(root_dir, 'app', 'assets')
    end

    def sprite_file
      File.join(assets_dir, 'images', 'sprite.svg')
    end

    private

    def register_engine
      require_relative 'evil_icons/engine'
    end

    def register_sprockets
      Sprockets.append_path(File.join(File.expand_path('../../', __FILE__), 'assets'))
    end

    def register_helpers
      require_relative 'evil_icons/helpers'
    end

  end
end

EvilIcons.register!
