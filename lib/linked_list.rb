class LinkedList

  def initialize
    @head = nil
  end

  def pop
    raise ArgumentError.new("Cannot pop on an empty list") if @head == nil

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

  def push(item)
    node = Node.new
    node.data = item
    node.next = nil

    if @head.nil? 
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

  def peek
    raise ArgumentError.new("Can't use peek on empty list") if @head.nil?

    current = @head
    while current.next != nil
      current = current.next
    end
    return current.data
  end

  def size
    return 0 if @head.nil?
    
    counter = 1

    current = @head
    while current.next != nil
      current = current.next
      counter += 1
    end

    return counter
  end
 
  private

  class Node
   
    attr_accessor :data, :next

  end

end
