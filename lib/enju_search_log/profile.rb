module EnjuSearchLog
  module EnjuProfile
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def enju_search_log_profile_model
        attr_accessible :save_search_history
        attr_accessible :save_search_history, :as => :admin
      end
    end
  end
end
