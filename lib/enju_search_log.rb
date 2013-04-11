require "enju_search_log/engine"
require "enju_search_log/user"

module EnjuSearchLog
end

ActiveRecord::Base.send :include, EnjuSearchLog::EnjuUser
