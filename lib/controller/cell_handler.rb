module Conway
  class CellHandler
    NUM_DIRECTION = 8
    DIRECTION_X = [0, 0, 1, -1, 1, 1, -1, -1].freeze
    DIRECTION_Y = [1, -1, 0, 0, -1, 1, 1, -1].freeze

    def initialize(alive_cells)
      @alive_cells = alive_cells
    end

    def get_neighboring_cells(pos)
      x, y = pos
      lst = []
      (0..NUM_DIRECTION - 1).each do |i|
        cx = x + DIRECTION_X[i]
        cy = y + DIRECTION_Y[i]
        lst << Conway.cell(cx, cy)
      end
      lst
    end

    def get_num_of_surviving_cells(pos)
      neighboring_cells = get_neighboring_cells(pos)
      num = 0
      neighboring_cells.each do |e|
        num += 1 if @alive_cells.include?(e)
      end
      num
    end

    def cell_survive?(pos)
      return false unless @alive_cells.include?(pos)

      num = get_num_of_surviving_cells(pos)
      [2, 3].include?(num)
    end
  end
end
