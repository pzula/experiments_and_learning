class LinkedList

  def initialize
    @head = nil
  end

  def empty?
    @head.nil?
  end

  def pop
    raise ArgumentError.new("Cannot pop on an empty list") if empty?
    current = @head
    # if there is only one element in the list
    if current.next.nil?
      data = current.data
      @head = nil
      return data
    else
      while current.next.next != nil
        current = current.next
      end

      data = current.next.data
      current.next = nil
      return data
    end
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

    return size
  end

  def push(item)
    node = Node.new(item, nil)

    if empty?
      @head = node
    else
      node.next = @head
      @head = node
    end

    return size
  end

  def peek
    raise ArgumentError.new("Can't use peek on empty list") if empty?

    current = @head
    while current.next != nil
      current = current.next
    end
    return current.data
  end

  def size
    return 0 if empty?
    
    counter = 1

    current = @head
    while current.next != nil
      current = current.next
      counter += 1
    end

    return counter
  end
 
  private

  Node = Struct.new(:data, :next)
end
