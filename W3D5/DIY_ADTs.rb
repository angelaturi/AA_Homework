class Stack
    attr_reader :array

    def initialize
        @array = []
    end

    def push(el)
        array.push(el)
    end

    def pop
        array.pop
    end

    def peek
        array.last
    end
end


class Queue
    attr_reader :array

    def initialize
        @array = []
    end

    def enqueue(el)
        array.unshift(el)
        el
    end

    def dequeue
        array.pop
    end

    def peek
        array.last
    end
end


class Map

    attr_reader :array
    
    def initialize
        @array = []
    end

    def set(key, value)
        array.each_with_index do |pair, idx|
            if pair[0] == key
                array[idx][1] = value
            else
                array.push([key, value])
            end
        end
        value
    end

    def get(key)
        array.each do |pair|
            if pair[0] == key
                return pair[1]
            end
        end
    end
    
    def delete(key)
        get(key)
        array.reject! { |pair| pair[0] == key }
        value
    end
    
    def show
        deep_dup(array)
    end

    def deep_dup(arr)
        res = []

        arr.each do |el|
            if el.is_a?(Array)
                res << deep_dup(el)
            else 
                res << el
            end
        end

        res
    end
end