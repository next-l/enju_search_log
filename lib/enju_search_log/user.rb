module EnjuSearchLog
  module SearchLogUser
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def enju_search_log_user
        attr_accessible :save_search_history
        attr_accessible :save_search_history, :as => :admin
        has_many :search_histories, :dependent => :destroy
      end
    end
  end
end
