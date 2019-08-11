require 'rails_helper'

RSpec.describe Calculator do
  describe '#sumar' do
    let(:result) { subject.sumar(a,b) }
    context 'numbers are received' do
      let(:a) { 1 }
      let(:b) { 2 }
      it 'should return sum of that numbers' do
        expect(result).to eq(3)
      end
    end
  end
end
