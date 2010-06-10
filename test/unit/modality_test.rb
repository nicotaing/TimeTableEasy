# == Schema Information
#
# Table name: modalities
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  is_exam    :boolean
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class ModalityTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
