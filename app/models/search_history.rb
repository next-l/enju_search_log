class SearchHistory < ActiveRecord::Base
  scope :not_found, -> { where(number_of_records: 0) }
  belongs_to :user

  paginates_per 10

  # http://d.hatena.ne.jp/rubyco/20070528
  def self.not_found_query(number, duration = 1.year.ago)
    self.not_found.where('created_at > ?', duration).all.collect(&:query).inject(Hash.new(0)){|r,e| r[e] += 1; r}.to_a.collect{|q| q if q[1] >= number.to_i}.compact
  end

  def self.remove_all_history(user)
    user.search_histories.update_all(user_id: nil)
  end
end

# == Schema Information
#
# Table name: search_histories
#
#  id                             :bigint           not null, primary key
#  user_id                        :bigint
#  operation                      :string           default("searchRetrieve")
#  sru_version                    :float            default(1.2)
#  query                          :string
#  start_record                   :integer
#  maximum_records                :integer
#  record_packing                 :string
#  record_schema                  :string
#  result_set_ttl                 :integer
#  stylesheet                     :string
#  extra_request_data             :string
#  number_of_records              :integer          default(0)
#  result_set_id                  :string
#  result_set_idle_time           :integer
#  records                        :text
#  next_record_position           :integer
#  diagnostics                    :text
#  extra_response_data            :text
#  echoed_search_retrieve_request :text
#  created_at                     :datetime         not null
#  updated_at                     :datetime         not null
#
