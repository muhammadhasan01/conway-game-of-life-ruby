require './lib/model/cell'
require './lib/controller/cell_handler'

describe 'CellHandler' do
  describe '#get_neighboring_cells' do
    context 'given certain cell' do
      cell_handler = Conway::CellHandler.new(Set[])
      lst = cell_handler.get_neighboring_cells(Conway.cell(0, 0))
      expected = [[0, 1], [0, -1], [1, 0], [-1, 0], [1, -1], [1, 1], [-1, 1], [-1, -1]]
      it 'should return correct neighboring cell' do
        expect(lst).to eq(expected)
      end
    end
  end

  describe '#get_num_of_surviving_cells' do
    context 'given certain state' do
      cell_handler = Conway::CellHandler.new(Set[[0, 0], [-1, 0], [0, 1]])
      num = cell_handler.get_num_of_surviving_cells(Conway.cell(0, 0))
      expected = 2
      it 'should return correct num surviving cell' do
        expect(num).to eq(expected)
      end
    end
  end
end
