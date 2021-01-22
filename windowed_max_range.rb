def naive_windowed_max_range(arr, window)
    current_max_range = nil
    (0..arr.length - window).each do |i|
        min = arr[i...i+window].min
        max = arr[i...i+window].max
        diff = max - min
        if current_max_range.nil? || diff > current_max_range
            current_max_range = diff
        end
    end
    current_max_range
end

# O(n^2) for both time and space

p naive_windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p naive_windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p naive_windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p naive_windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8

class MyQueue
    def initialize
        @store = []
    end

    def enqueue(ele)
        @store << ele
    end

    def dequeue
        @store.shift
    end

    def peek
        @store.first
    end

    def size
        @store.length
    end

    def empty?
        @store.empty?
    end
end

class MyStack
    def initialize
        @store = []
    end

    def peek
        @store.last
    end

    def size
        @store.length
    end

    def empty?
        @store.empty?
    end

    def pop
        @store.pop
    end

    def push(ele)
        @store.push(ele)
    end
end

class StackQueue
    def initialize
        @stack1 = MyStack.new
        @stack2 = MyStack.new
    end

    def size
        @stack1.length
    end

    def empty?
        @stack1.empty?
    end

    def enqueue(ele)
        @stack1.push(ele)
    end

    def dequeue
        until @stack1.empty?
            ele = @stack1.pop
            @stack2.push(ele)
        end

        output = ele.pop

        until @stack2.empty?
            ele = @stack2.pop
            @stack1.push(ele)
        end

        output
    end
end

[4,5,6]

[]

6