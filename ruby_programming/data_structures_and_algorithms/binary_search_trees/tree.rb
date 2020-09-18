Node = Struct.new(:value, :left, :right) do
  include Comparable


end

class Tree
  attr_reader :root

  def initialize(arr)
    @root = build_tree(arr)
  end

  def build_tree(arr)
    return nil if arr.length == 0
    return Node.new(arr[0]) if arr.length == 1

    sorted = arr.sort.uniq

    mid = (sorted.length-1) / 2

    left_subarray = mid > 0 ? sorted[0...mid] : []
    right_subarray = sorted[mid+1..-1]

    root = Node.new(sorted[mid], build_tree(left_subarray), build_tree(right_subarray))
  end

  def insert(value)
    if @root.nil?
      @root = Node.new(value, nil, nil)
      return
    end

    parentPointer = root
    pointer = root
    isLeft = nil

    until pointer.nil?
      parentPointer = pointer

      if value == pointer.value
        return # No duplicate entries
      elsif value < pointer.value
        pointer = pointer.left
        isLeft = true
      else
        pointer = pointer.right
        isLeft = false
      end
    end

    isLeft ? parentPointer.left = Node.new(value) : parentPointer.right = Node.new(value)
  end


  def delete(value)
    



  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

end

arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

tree = Tree.new(arr)
p tree.pretty_print

tree.insert(2)
tree.insert(6)

p tree.pretty_print