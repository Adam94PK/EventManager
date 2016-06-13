require 'rails_helper'

RSpec.describe Standard, type: :model do
  describe 'when new' do
    let(:standard) { Standard.new }
    it 'should include the :name' do
      expect(standard).to have_attribute(:name)
    end

    it 'should include the :standard' do
      expect(standard).to have_attribute(:standard)
    end
  end

  describe 'when saved' do
  	let(:standard) do
      Standard.new(name: '1 star', standard: 1)
    end

    it 'should not save if :name is nil' 
    it 'should not save if :standard is nil'
  end
end