# == Schema Information
#
# Table name: study_periods
#
#  id         :integer         not null, primary key
#  startdate  :date
#  enddate    :date
#  created_at :datetime
#  updated_at :datetime
#  cursus_id  :integer
#  name       :string(255)
#

require 'test_helper'

class StudyPeriodTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
