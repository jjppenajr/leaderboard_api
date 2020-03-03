require 'rails_helper'

RSpec.describe Entry, type: :model do
  context 'Validations' do
    it { is_expected.to be_mongoid_document }

    it { is_expected.to validate_presence_of(:score) }
    it { is_expected.to validate_presence_of(:scored_at) }
    it { is_expected.to validate_presence_of(:rank) }
    it { is_expected.to validate_presence_of(:name) }

    it { is_expected.to belong_to(:board) }
    it { is_expected.to belong_to(:user) }
  end
end
