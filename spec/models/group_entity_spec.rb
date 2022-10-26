require 'rails_helper'

RSpec.describe GroupEntity, type: :model do
  subject do
    user = User.create(name: 'Bruk Teshome', password: '0123456', email: 'bruk21@gmail.com')
    group = Group.create(name: 'Group 1')
    Entity.create(name: 'Hilux', amount: '2', user:)
    GroupEntity.new(group:, entity: Entity.first)
  end

  before { subject.save }

  context 'Test for validation : ' do
    it 'Group should be valid' do
      expect(subject).to be_valid
    end

    it 'Group should be present' do
      subject.group = nil
      expect(subject).to_not be_valid
    end

    it 'Entity should be present' do
      subject.entity = nil
      expect(subject).to_not be_valid
    end
  end
end
