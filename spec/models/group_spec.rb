require 'rails_helper'

RSpec.describe Group, type: :model do
  subject do
    user = User.create(name: 'Bruk Teshome', password: '0123456', email: 'bruk21@gmail.com')
    Group.new(name: 'motor', icon: 'https://icon.png', user:)
  end

  before { subject.save }

  context 'Test for validation : ' do
    it 'Name should be valid' do
      expect(subject).to be_valid
    end

    it 'Name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'Icon should be present' do
      subject.icon = nil
      expect(subject).to_not be_valid
    end

    it 'Name should be present' do
      subject.name = 'motor'
      expect(subject).to be_valid
    end
  end
end
