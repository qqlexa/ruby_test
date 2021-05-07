require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  context 'validation tests' do
    it 'ensures first name presence' do
      user = User.new(last_name: 'Last', email: 'sample@example.com').save
      except(user).to eq(false)
    end
    it 'ensures last name presence' do

    end
  end

  context 'scope tests' do
  end
end
