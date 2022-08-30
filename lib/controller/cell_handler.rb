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

    def cells_to_be_dead
      lst = []
      @alive_cells.each do |e|
        lst << e unless cell_survive?(e)
      end
      lst
    end

    def freq_dead_cell
      freq = Hash.new(0)
      @alive_cells.each do |p|
        neighboring_cells = get_neighboring_cells(p)
        neighboring_cells.each do |c|
          freq[c] = freq[c] + 1 unless @alive_cells.include?(c)
        end
      end
      freq
    end

    def cells_to_be_resurrected
      lst = []
      freq = freq_dead_cell
      freq.each do |key, value|
        lst << key if value == 3
      end
      lst
    end
  end
end
