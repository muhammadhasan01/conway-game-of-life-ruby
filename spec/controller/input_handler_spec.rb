require './lib/controller/input_handler'

describe 'InputHandler' do
  describe '#state_from_file' do
    context 'given valid file' do
      input_handler = Conway::InputHandler.new
      state = input_handler.state_from_file('inputs/default.txt')
      expected = Set[[3, 0], [4, -1], [2, -2], [3, -2], [4, -2]]
      it 'should return correct state' do
        expect(state).to eq(expected)
      end
    end

    context 'given invalid file' do
      input_handler = Conway::InputHandler.new
      it 'should raise an exception' do
        input_handler.state_from_file('inputs/invalid.txt')
      rescue StandardError => e
        expect(e.message).to eq("Invalid character '*' at (2, 0)")
      end
    end
  end
end
