module Conway
  class CellHandler
    NUM_DIRECTION = 8
    DIRECTION_X = [0, 0, 1, -1, 1, 1, -1, -1].freeze
    DIRECTION_Y = [1, -1, 0, 0, -1, 1, 1, -1].freeze

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
  end
end
