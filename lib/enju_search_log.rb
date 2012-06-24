require "enju_search_log/engine"
require "enju_search_log/user"

module EnjuSearchLog
  def save_search_history(query, offset = 0, total = 0, user = nil)
    return unless user.try(:save_search_history)
    if configatron.write_search_log_to_file
      write_search_log(query, total, user)
    else
      history = SearchHistory.new(:query => query, :start_record => offset + 1, :maximum_records => nil, :number_of_records => total)
      history.user = user
      history.save
    end
  end

  def write_search_log(query, total, user)
    if user
      username = user.username if user.save_search_history
    end
    SEARCH_LOGGER.info "#{Time.zone.now}\t#{query}\t#{total}\t#{username}\t#{params[:format]}"
  end
end

ActiveRecord::Base.send :include, EnjuSearchLog::SearchLogUser
