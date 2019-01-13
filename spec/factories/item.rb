FactoryBot.define do
  factory :item do |f|
    f.sequence(:item_identifier){|n| "item_#{n}"}
    f.circulation_status_id{CirculationStatus.find(1).id}
    f.manifestation_id{FactoryBot.create(:manifestation).id}
    f.bookstore_id { 1 }
    f.budget_type_id { 1 }
  end
end
