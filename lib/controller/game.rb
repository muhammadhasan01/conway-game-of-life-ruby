require 'set'
require './lib/controller/input_handler'
require './lib/controller/cell_handler'
require './lib/model/cell'
require './lib/view/board_renderer'

module Conway
  class Game
    def next_state(state)
      ret = state
      cell_handler = Conway::CellHandler.new(ret)

      dead_cells = cell_handler.cells_to_be_dead
      resurrected_cells = cell_handler.cells_to_be_resurrected

      dead_cells.each do |c|
        ret.delete(c)
      end

      resurrected_cells.each do |c|
        ret.add(c)
      end

      ret
    end
  end
end
