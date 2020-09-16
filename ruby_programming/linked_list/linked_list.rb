class LinkedList
  attr_reader :size, :head, :tail

    def initialize(value = nil)
      @size = 0
      @head = Node.new(value)
      @tail = @head
      @size += 1 unless value.nil?
    end

    def append(value)
      if size == 0
        initialize(value)
      else
        new_node = Node.new(value)
        @tail.next_node = new_node
        @tail = new_node
        @size += 1
      end
    end

    def prepend(value)
      if size == 0
        initialize(value)
      else
        new_node = Node.new(value)
        new_node.next_node = @head
        @head = new_node 
        @size += 1
      end
    end

    def at(index)
      value = @head
      index.times do
        value = value.next_node unless value.nil?
      end
      value
    end

    def pop
      return nil if size.zero?

      removed_value = nil
      if size == 1
        @head = nil
        removed_value = @tail
        @tail = nil
      else
        new_last = at(size - 2)
        removed_value = @tail
        @tail = new_last
        @tail.next_node = nil
      end
      @size -= 1
      removed_value
    end

    def contains?(value)
      node = @head
      until node.value == value.to_s
        return false if node.next_node.nil?
        node = node.next_node
      end
      node.value
    end

    def find(value)
      index = 0
      node = @head
      until node.nil?
        return "Found at position: #{index}" if node.value == value.to_s
        node = node.next_node
        index += 1
      end
      "Not found"
    end

    def to_s
      values = ''
      node = @head
      until node.nil?
        values << "( #{node.value} )"
        node = node.next_node
        values << ' -> ' unless node.nil?
      end
      values
    end

# Extra Credit Methods
    def insert_at(value, index)
      if index < 1
        self.prepend(value)
        return
      else
        new_node = Node.new(value)
        previous_node = self.at(index-1)
        shifted_node = self.at(index)
        previous_node.next_node = new_node
        new_node.next_node = shifted_node
        return
      end
    end

    def remove_at(index)
      if index < 1
        @head = head.next_node
      else
        previous_node = self.at(index-1)
        removed_node = self.at(index)
        new_next_node = self.at(index+1)
        
        previous_node.next_node = new_next_node
      end
    end
  
end

class Node
  attr_accessor :next_node

  def initialize(value = nil)
    @value = value
    @next_node = nil
  end

  def value
    @value.to_s
  end

end


#Testing the methods
puts 'Lets create a link list with the values 4 - 12 - 13 - 15 - 17'
new_list = LinkedList.new(12)
new_list.append(13)
new_list.append(15)
new_list.append(17)
new_list.prepend(4)
puts "list : #{new_list.to_s}"
puts "head : #{new_list.head.value}"
puts "tail : #{new_list.tail.value}"
puts "size : #{new_list.size}"
puts "index at 3 : #{new_list.at(3).value}"
new_list.pop
puts "pop list : #{new_list.to_s}"
puts "list contains 13? : #{new_list.contains?(13)}"
puts "list contains 10? : #{new_list.contains?(10)}"
puts "find 12? : #{new_list.find(12)}"
puts "find 16? : #{new_list.find(16)}"

#bonus methods
puts ''
puts 'Here are the bonus methods'
new_list.insert_at(82, 2)
puts "insert 82 at index 2 : #{new_list.to_s}"
new_list.insert_at(91, 5)
puts "insert 91 at index 5 : #{new_list.to_s}"
new_list.remove_at(4)
puts "remove index 4 : #{new_list.to_s}"
new_list.remove_at(2)
puts "remove index 2 : #{new_list.to_s}"