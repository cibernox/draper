module Draper
  module ViewHelpers
    extend ActiveSupport::Concern

    module ClassMethods

      # Access the helpers proxy to call built-in and user-defined
      # Rails helpers from a class context.
      #
      # @return [HelperProxy] the helpers proxy
      def helpers
        @helpers ||= Draper::HelperProxy.new
      end
      alias_method :h, :helpers

    end

    # Access the helpers proxy to call built-in and user-defined
    # Rails helpers. Aliased to `h` for convenience.
    #
    # @return [HelperProxy] the helpers proxy
    def helpers
      self.class.helpers
    end
    alias_method :h, :helpers

    # Localize is something that's used quite often. Even though
    # it's available through helpers, that's annoying. Aliased
    # to `l` for convenience.
    def localize(*args)
      helpers.localize(*args)
    end
    alias_method :l, :localize

  end
end
