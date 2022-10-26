require 'rails_helper'

RSpec.describe Entity, type: :model do
  subject do
    user = User.create(name: 'Bruk Teshome', password: '0123456', email: 'bruk@gmail.com')
    Entity.new(name: 'Hilux', amount: '2', user:)
  end

  before { subject.save }

  context 'Test for validation : ' do
    it 'Name should be present' do
      subject.name = 'Hilux'
      expect(subject).to be_valid
    end

    it 'Name should be valid' do
      expect(subject).to be_valid
    end

    it 'Name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'Amount should be present' do
      subject.amount = nil
      expect(subject).to_not be_valid
    end
  end
end
