require 'rspec'
require_relative '../lib/linked_list'

describe LinkedList do

  context "#initialize" do
    subject { LinkedList.new }

    it "is empty" do
      subject.size.should eq 0
    end

  end

  context "#append" do

    it "adds an element to the end of the list" do
      subject.append("Hello")
      subject.peek.should eq "Hello"
      subject.append("World")
      subject.peek.should eq "World"
    end
   
    it "increases the size of the list" do
      5.times do |i|
        subject.append("Hello") 
        subject.size.should eq i+1 
      end
    end

    it "returns the size of the list after adding" do
      subject.append("Hello").should eq 1
      subject.append("World").should eq 2     
    end
  end

  context "#pop" do
  
    subject do
      l = LinkedList.new
      l.append("Hello")
      l.append("World")
      l
    end

    it "reduces the size by 1" do
      size = subject.size
      subject.pop
      subject.size.should eq size - 1
    end

    it "removes the last element" do
      last = subject.peek
      subject.pop
      subject.peek.should_not eq last
    end

    it "returns the element that was popped" do
      last = subject.peek
      subject.pop.should eq last
    end

    it "raise an exception if the list empty" do
      lambda {
        l = LinkedList.new
        l.pop
      }.should raise_error(ArgumentError)
    end
  end

  context "#peek" do

    subject do
      l = LinkedList.new
      l.append("Hello")
      l.append("World")
      l
    end

    it "returns the last element" do 
      subject.peek.should eq "World"
    end

    it "does not remove any elements" do
      size = subject.size
      subject.peek
      subject.size.should eq size
    end

    it "raises an expection if the list is empty" do
      lambda {
        l = LinkedList.new
        l.peek
      }.should raise_error(ArgumentError)
    end

  end

  context "#size" do

    it "returns 0 for an empty list" do 
      LinkedList.new.size.should eq 0 
    end

    it "returns a size for a non-empty list" do
      l = LinkedList.new
      l.append("Hello")
      l.append("World")
      l.size.should eq 2
    end

  end

  context "#push" do

    it "adds an element to the beginning of the list" do
      subject.push("Hello")
      subject.peek.should eq "Hello"
      subject.push("World")
      subject.peek.should eq "Hello"
    end
   
    it "increases the size of the list" do
      5.times do |i|
        subject.push("Hello") 
        subject.size.should eq i+1 
      end
    end

    it "returns the size of the list after adding" do
      subject.push("Hello").should eq 1
      subject.push("World").should eq 2     
    end
  end


  context "#empty?" do
    
    it "returns true when the list is empty" do
      l = LinkedList.new
      l.should be_empty
    end

    it "returns false when the list contains data" do
      l = LinkedList.new
      l.append("Hello")
      l.append("World")
      l.should_not be_empty
    end

  end


  context "#at" do

    subject do
      l = LinkedList.new
      l.append("Hello")
      l.append("World")
      l
    end

    it "returns the element at the index" do 
      subject.at(1).should eq "World"
      subject.at(0).should eq "Hello"
      subject.append("!") 
      subject.at(2).should eq "!"
    end

    it "does not remove any elements" do
      size = subject.size
      subject.at(1)
      subject.size.should eq size
    end

    it "raises an expection if the list is empty" do
      lambda {
        l = LinkedList.new
        l.at(1)
      }.should raise_error(ArgumentError)
    end

    it "raises an exception if the index does not exist" do
      lambda {
        subject.at(20)
      }.should raise_error(ArgumentError)
      lambda {
        subject.at(subject.size)
      }.should raise_error(ArgumentError)
    end
  end

  context "#pop_at" do

    subject do
      l = LinkedList.new
      l.push("Hello")
      l.push("World")
      l.push("Lists")
      l.push("Are Neat")
      l
    end

    it "removes the element at the specified index" do
      item = subject.at(1)
      subject.pop_at(1)
      subject.at(1).should_not eq item
    end

    it "reduce the size of the list by one" do
      size = subject.size
      subject.pop_at(1)
      subject.size.should eq size - 1
    end

    it "return the element at the specified index" do
      item = subject.at(1)
      subject.pop_at(1).should eq item
    end

    it "returns the first element on index 0" do
      item = subject.at(0)
      subject.pop_at(0).should eq item
    end

    it "returns the last element on index size - 1" do
      item = subject.at(subject.size - 1)
      subject.pop_at(subject.size - 1).should eq item

    end

    it "raises an exception if the list is empty" do
      lambda {
        l = LinkedList.new
        l.pop_at(1)
      }.should raise_error(ArgumentError)
    end

    it "raises an exception if the index does not exist" do
      lambda {
        subject.pop_at(20)
      }.should raise_error(ArgumentError)
    end

  end
end
