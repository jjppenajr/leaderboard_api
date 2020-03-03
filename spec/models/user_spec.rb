require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validations' do
    it { is_expected.to be_mongoid_document }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to have_many(:entries) }
  end
end
