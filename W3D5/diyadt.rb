class Stack
    def initialize
        @ivar = []
    end

    def push(el)
        @ivar.push(el)
    end

    def pop
        @ivar.pop
    end

    def peek
        @ivar[-1]
    end
end

# p stack = Stack.new
# p stack.push(1)
# p  stack.peek
# p  stack.push(2)
# p  stack.peek
# p  stack.push("hello")
# p  stack.peek
# p  stack.push(4)
# p  stack.peek
# p  stack.push("wassup")
# p  stack.peek
# p  stack.push([])
# p stack.peek 

#  5.times do
# p    stack.pop
# p    stack.peek
# end

class Queue

    def initialize
        @queue = []
    end

    def enqueue(el)
        @queue.push(el)
    end

    def dequeue
        @queue.shift
    end

    def peek
        @queue[0]
    end
end

# p q = Queue.new
# p q.enqueue(1)
# p q.peek
# p q.enqueue(2)
# p q.peek
# p q.enqueue(3)
# p q.peek
# p q.enqueue(4)
# p q.peek

# p q.dequeue
# p q.dequeue
# p q.dequeue

class Map
    def initialize
        @map = []
    end

    def set(key,value)
        if @map.none? {|subarray| subarray[0] == key}
            @map << [key,value]
        else
            @map.each {|subarray| subarray[1] = value if subarray[0] == key}
        end
    end

    def get(key)
        @map.each {|subarray| return subarray[1] if subarray[0] == key}
    end

    def delete(key)
        @map.each_with_index {|subarray,i| @map.delete_at(i) if subarray[0] == key }
    end

    def show
        p @map
    end
end

# m = Map.new
# p m.set(1, true)
# p m.set(1, "hello")
# p m.get(1)
# p m.set(2, true)
# p m.set(3, true)
# p m.set("Hello", true)
# p m.set("cheese", "wow")
# p m.set("bai", true)
# p m.set(5, true)
# p m.set(27, true)
# p m.set(11, true)
# p m.set(15, true)
# p m.set(5, "cheeseAgain")
# p m.delete(27)
# p m.delete(5)
# m.show
# m.show

