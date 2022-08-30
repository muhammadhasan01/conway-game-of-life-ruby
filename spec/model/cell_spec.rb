require './lib/model/cell'

describe 'cell' do
  describe 'equality' do
    context 'given two same cell' do
      first_cell = Conway.cell(1, 1)
      second_cell = Conway.cell(1, 1)

      it 'should be equal' do
        expect(first_cell).to eq(second_cell)
      end

      it 'should have the same hash' do
        expect(first_cell.hash).to eq(second_cell.hash)
      end
    end
  end
end
