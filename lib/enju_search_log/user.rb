module EnjuSearchLog
  module EnjuUser
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def enju_search_log_user_model
        include InstanceMethods
        has_many :search_histories, dependent: :destroy
      end
    end

    module InstanceMethods
      def save_history(query, offset = 0, total = 0, format = nil)
        return nil unless self.save_search_history
        if Setting.write_search_log_to_file
          write_search_log(query, total, username, format)
        else
          history = SearchHistory.new(query: query, start_record: offset + 1, maximum_records: nil, number_of_records: total)
          history.user = self
          history.save(validate: false)
        end
      end

      def write_search_log(query, total, username, format)
        logger = ActiveSupport::Logger.new(File.join(Rails.root, 'log', 'search.log'))
        logger.info "#{Time.zone.now}\t#{query}\t#{total}\t#{username}\t#{format}"
      end
    end
  end
end
