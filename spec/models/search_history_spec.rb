require 'spec_helper'

describe SearchHistory do
  fixtures :all

  it "should create search history" do
    user = users(:admin)
    user.save_search_history = true
    user.save_history('test', 1, 10).should be_truthy
  end

  it "should not create search history if the user disabled logging" do
    user = users(:admin)
    user.save_history('test', 1, 10).should be_nil
  end

  it "should destroy all history" do
    user = users(:admin)
    old_count = SearchHistory.count
    old_user_count = user.search_histories.count
    SearchHistory.remove_all_history(user)
    user.search_histories.count.should eq 0
    SearchHistory.count.should eq old_count
  end
end

# == Schema Information
#
# Table name: search_histories
#
#  id                             :integer          not null, primary key
#  user_id                        :integer
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
#  created_at                     :datetime
#  updated_at                     :datetime
#
