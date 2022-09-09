class Node
  attr_accessor :val ,:parent
  def initialize(val , parent=nil)
    @val = val
    @parent = parent
  end

  def print_node
    p @val
    p @parent
  end
end

class KnightTravails
  attr_accessor :root
  def initialize(strt_x, strt_y, end_x, end_y)
    @strt_x=strt_x
    @strt_y=strt_y
    @end_x=end_x
    @end_y=end_y
    @min_moves = 0
    @root = nil
  end

  def isValid?(pos)
    # p pos[0]
    if pos[0]<1 || pos[0]>8
      return false
    elsif pos[1]<1 || pos[1]>8
      return false
    end
    return true
  end

  def find_moves
    curr_pos = Node.new([@strt_x,@strt_y])
    end_pos = [@end_x,@end_y]
    dx=[1,1,-1,-1,2,2,-2,-2]
    dy=[2,-2,2,-2,1,-1,1,-1]
    bfs = []
    bfs.push(curr_pos)
    flag = 0
    for pos in bfs
      for i in 0..7
        temp = pos
        temp = Node.new([pos.val[0].to_s.to_i + dx[i], pos.val[1].to_s.to_i + dy[i]], pos)
        if isValid?(temp.val) and temp.val!=curr_pos
          # p pos
          if temp.val == end_pos 
            # p bfs
            @root = temp
            flag = 1
            break
          end
          bfs.push(temp)
        end
      end
      if flag == 1
        break
      end
    end
  end

  def print_moves(val = @root)
    while @root.parent
      @min_moves+=1
      p @root.val
      @root = @root.parent
    end
    p @min_moves
  end
end

kt = KnightTravails.new(1,1,4,4)
kt.find_moves
kt.print_moves

# arr = [2,3,4]
# arr.push(9)
# pr = arr.shift
# p arr
# p pr
