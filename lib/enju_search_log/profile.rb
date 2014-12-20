module EnjuSearchLog
  module EnjuProfile
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def enju_search_log_profile_model
      end
    end
  end
end
