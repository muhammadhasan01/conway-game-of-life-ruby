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

  describe '#is_cell_survive?' do
    context 'given a cell on two neighboring value' do
      cell_handler = Conway::CellHandler.new(Set[[0, 0], [-1, 0], [0, 1]])
      is_survive = cell_handler.cell_survive?(Conway.cell(0, 0))
      expected = true
      it 'should return surviving cell as true' do
        expect(is_survive).to eq(expected)
      end
    end

    context 'given a cell on three neighboring value' do
      cell_handler = Conway::CellHandler.new(Set[[0, 0], [-1, 0], [0, 1], [1, 0]])
      is_survive = cell_handler.cell_survive?(Conway.cell(0, 0))
      expected = true
      it 'should return surviving cell as true' do
        expect(is_survive).to eq(expected)
      end
    end
  end

  describe '#cells_to_be_dead' do
    context 'given certain state' do
      cell_handler = Conway::CellHandler.new(Set[[0, 0], [-1, 0], [0, 1], [3, 4]])
      lst = cell_handler.cells_to_be_dead
      expected = [[3, 4]]
      it 'should return correct cells to be dead' do
        expect(lst).to eq(expected)
      end
    end
  end
end
