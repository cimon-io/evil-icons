module Purpur
  class Engine < Rails::Engine

    initializer 'purpur.view_helpers' do
      ActiveSupport.on_load :action_view do
        include ::Purpur::Helpers
      end
    end

  end
end
