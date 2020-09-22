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
        pointer = parent_node.left
        
        if pointer.value == value 
          is_left = true
          i = 1 
        else
          return delete(value, pointer, pointer.left)
        end

      else
        pointer = parent_node.right

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

    return "Deleted #{value} from the tree"
  end

  #returns the smallest node child for a given parent node
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

  def level_order
    node_array = [[root.value]]
    parents = [root]

    until parents.empty?
      sub_array = []
      new_parents = []
      parents.each do |parent|
        if parent.left != nil
          sub_array << parent.left.value
          new_parents << parent.left
        end
        if parent.right != nil
          sub_array << parent.right.value
          new_parents << parent.right
        end
      end

      parents = new_parents
      node_array << sub_array if !sub_array.empty?
    end

    return node_array
  end

  def preorder(node = @root, array = [])
    array.push(node.value)
    preorder(node.left, array) unless node.left.nil?
    preorder(node.right, array) unless node.right.nil?

    array
  end


  def inorder(node = @root, array = [])
    inorder(node.left, array) unless node.left.nil?
    array.push(node.value)
    inorder(node.right, array) unless node.right.nil?

    array
  end


  def postorder(node = @root, array = [])
    postorder(node.left, array) unless node.left.nil?
    postorder(node.right, array) unless node.right.nil?
    array.push(node.value)

    array
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

#tree.insert(6)
#p tree.pretty_print

=begin
p tree.find(2)
p tree.delete(67)
p tree.delete(4)
p tree.pretty_print
p tree.delete(10)
=end
p tree.level_order


p tree.preorder
p tree.inorder
p tree.postorder