require './lib/controller/game'

describe 'Game' do
  describe '#next_state' do
    context 'given certain state' do
      state = Set[[0, 0], [-1, 0], [0, 1], [3, 4]]
      next_state = Conway::Game.new.next_state(state)
      expected = Set[[0, 0], [-1, 0], [0, 1], [-1, 1]]
      it 'should return correct next state' do
        expect(next_state).to eq(expected)
      end
    end
  end
end
