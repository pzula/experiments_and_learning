require 'rspec'
require_relative '../lib/linked_list'

describe LinkedList do

  context "#initialize" do
    subject { LinkedList.new }

    it "is empty" do
      subject.size.should eq 0
    end

  end

  context "#push" do

    it "adds an element to the end of the list" do
      subject.push("Hello")
      subject.peek.should eq "Hello"
      subject.push("World")
      subject.peek.should eq "World"
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

  context "#pop" do
  
    subject do
      l = LinkedList.new
      l.push("Hello")
      l.push("World")
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
      l.push("Hello")
      l.push("World")
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
      l.push("Hello")
      l.push("World")
      l.size.should eq 2
    end

  end


  context "#empty?" do
    
    it "returns true when the list is empty" do
      l = LinkedList.new
      l.should be_empty
    end

    it "returns false when the list contains data" do
      l = LinkedList.new
      l.push("Hello")
      l.push("World")
      l.should_not be_empty
    end

  end
end
