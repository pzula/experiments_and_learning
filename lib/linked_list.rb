class LinkedList

  attr_reader :size

  def initialize
    @head = nil
    @size = 0
  end

  def empty?
    @head.nil?
  end

  def at(index)
    raise ArgumentError.new("Cannot find index on an empty list") if empty?
    if index >= size
      raise ArgumentError.new("Index does not exist")
    end
    
    current = @head

    index.times do 
      current = current.next
    end

    return current.data
  end

  def pop
    raise ArgumentError.new("Cannot pop on an empty list") if empty?
    current = @head
    # if there is only one element in the list
    if current.next.nil?
      data = current.data
      @head = nil
    else
      while current.next.next != nil
        current = current.next
      end

      data = current.next.data
      current.next = nil
    end
    
    @size -= 1
    return data
  end

  def pop_at(index)
    raise ArgumentError.new("Cannot pop on an empty list") if empty?
    if index >= size
      raise ArgumentError.new("Cannot find index")
    end

    if index == 0
      
      data = @head.data
      @head = @head.next

    else

      current = @head
      (index - 1).times do 
        current = current.next
      end

      data = current.next.data
      current.next = current.next.next

    end

    @size -= 1
    return data
  end

  def append(item)
    node = Node.new(item, nil)

    if empty? 
      @head = node
    else
      current = @head
      while current.next != nil
        current = current.next
      end
      current.next = node
    end

    @size += 1
    return @size
  end

  def push(item)
    node = Node.new(item, nil)

    if empty?
      @head = node
    else
      node.next = @head
      @head = node
    end

    @size += 1
    return @size
  end

  def peek
    raise ArgumentError.new("Can't use peek on empty list") if empty?

    current = @head
    while current.next != nil
      current = current.next
    end
    return current.data
  end
 
  private

  Node = Struct.new(:data, :next)
end
