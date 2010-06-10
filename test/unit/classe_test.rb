# == Schema Information
#
# Table name: classes
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  campus_id       :integer
#  study_period_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#

require 'test_helper'

class ClasseTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
