require "enju_search_log/engine"
require "enju_search_log/user"
require "enju_search_log/profile"

module EnjuSearchLog
end

ActiveRecord::Base.send :include, EnjuSearchLog::EnjuUser
ActiveRecord::Base.send :include, EnjuSearchLog::EnjuProfile
