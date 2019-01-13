class User < ActiveRecord::Base
  devise :database_authenticatable, #:registerable,
    :recoverable, :rememberable, :trackable, #, :validatable
    :lockable, lock_strategy: :none, unlock_strategy: :none

  # Setup accessible (or protected) attributes for your model

  include EnjuSeed::EnjuUser
  include EnjuMessage::EnjuUser
  include EnjuCirculation::EnjuUser
  include EnjuSearchLog::EnjuUser
end
