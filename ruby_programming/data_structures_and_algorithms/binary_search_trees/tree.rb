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

    parent_node = root
    pointer = root
    is_left = nil

    until value == parent_node.value || pointer.nil?
      parent_node = pointer

      if value < pointer.value
        pointer = pointer.left
        is_left = true
      else
        pointer = pointer.right
        is_left = false
      end
    end

    is_left ? parent_node.left = Node.new(value) : parent_node.right = Node.new(value)
  end


  def delete(value, parent_node = root, pointer = root)
    return if find(value).nil? #value to be deleted not found

    is_left = nil
    i = 0
    loop do
      if value < parent_node.value
        pointer = parent_node.left #if parent_node.left != nil
        #puts "#{parent_node.value} and #{pointer.value}"
        
        if pointer.value == value 
          is_left = true
          i = 1 
        else
          return delete(value, pointer, pointer.left)
        end

      else
        pointer = parent_node.right #if parent_node.right != nil
        
        #puts "#{parent_node.value} and #{pointer.value}"
        if pointer.value == value 
          is_left = false
          i = 1 
        else
          return delete(value, pointer, pointer.right)
        end
      end
      break if i == 1
    end

    if pointer.left.nil? && pointer.right.nil?
      if is_left
        parent_node.left = nil
      else
        parent_node.right = nil
      end
    elsif pointer.left.nil?
      if is_left
        parent_node.left = pointer.right
      else
        parent_node.right = pointer.right
      end
    elsif pointer.right.nil?
      if is_left
        parent_node.left = pointer.left
      else
        parent_node.right = pointer.left
      end
    else
      minimum_node = min_value_node(pointer.right)
      if is_left
        temp = pointer.left
        parent_node.left = minimum_node
        minimum_node.left = temp
      else
        temp = pointer.left
        parent_node.right = minimum_node
        minimum_node.left = temp
      end
    end

    return #"end of #{parent_node.value} and #{pointer.value}"
  end

  def min_value_node(node)
    current = node

    while current.left != nil
      current = current.left
    end
    return current
  end

  def find(value)
    pointer = root

    until pointer.nil?
      return pointer if pointer.value == value

      if value < pointer.value
        pointer = pointer.left
      else
        pointer = pointer.right
      end
    end
    p "Unable to locate the node: #{value}"
    return nil
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

#tree.insert(2)
#tree.insert(6)
#p tree.pretty_print

#p tree.find(2)
#p tree.delete(3)
p tree.delete(9)
p tree.pretty_print
#p tree.delete(10)
#p tree.delete 2

