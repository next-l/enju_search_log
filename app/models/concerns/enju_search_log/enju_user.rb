module EnjuSearchLog
  module EnjuUser
    extend ActiveSupport::Concern

    included do
      has_many :search_histories, dependent: :destroy
    end

    def save_history(query, offset = 0, total = 0, format = nil)
      return nil unless self.save_search_history
      if LibraryGroup.site_config.settings[:write_search_log_to_file]
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
