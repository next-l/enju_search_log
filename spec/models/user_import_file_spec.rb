require 'rails_helper'

describe UserImportFile do
  fixtures :all

  describe "when its mode is 'create'" do
    before(:each) do
      @file = UserImportFile.create!(
        default_user_group: UserGroup.find_by(name: 'user'),
        default_library: libraries(:library_00003),
        user: users(:admin)
      )
      @file.user_import.attach(io: File.new("#{Rails.root}/../../examples/user_import_file_sample.tsv"), filename: 'attachment.txt')
    end

    it "should be imported" do
      @file.import_start.should eq({user_imported: 5, user_found: 0, failed: 0, error: 3})
      user003 = User.find_by(username: 'user003')
      user003.profile.save_search_history.should be_falsy
    end
  end
end
