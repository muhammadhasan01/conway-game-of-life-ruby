require './lib/view/board_renderer'

describe 'BoardRenderer' do
  describe '#render_board' do
    context 'given certain state' do
      board_renderer = Conway::BoardRenderer.new(Set[[0, 0], [1, 0], [2, 0]])
      res = board_renderer.render_board(0, 2, 0, 0)
      expected = '###\\n'
      it 'should return correct rendering' do
        expect(res).to eq(expected)
      end
    end
  end
end
