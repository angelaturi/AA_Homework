# Sluggish Octopus - O(n^2)/quadratic

def biggest_fish(array)
    array.each_with_index do |ele1, i1|
        max_length = true
        array.each_with_index do |ele2, i2|
            next if i1 == i2
            max_length = false if ele2.length > ele1.length
        end

        return ele1 if max_length
    end
end


# Dominant Octopus - O(n log n)/log linear

class Array

  def merge_sort(&prc)
    return self if count <= 1

    middle = self.length / 2
    left = self[0...middle]
    right = self[middle..-1]

    sorted_left = left.merge_sort(&prc)
    sorted_right = right.merge_sort(&prc)

    self.merge(sorted_left, sorted_right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    new_arr = []

    prc ||= Proc.new { |a,b| a<=>b }

    while !left.empty? && !right.empty?
      if prc.call(left.first, right.first) <= 0
        new_arr << left.shift
      else
        new_arr << right.shift
      end

      new_arr + left + right
    end
  end
end

def biggest_fish(array)
  prc = Proc.new { |x, y| y.length <=> x.length }
  fishes.merge_sort(&prc)[0]
end


# Clever Octopus - O(n)/linear

def biggest_fish(array)
    biggest_fish  = array[0]

    array.each do |ele|
        if ele.length > biggest_fish.length
            biggest_fish = ele
        end
    end

    biggest_fish
end


# Dancing Octopus - slow dance - O(n)/linear

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(direction, tiles_array)
    tiles_array.each_with_index do |tile, index|
        return index if tile == direction
    end
end

# Dancing octopus - constant dance! - O(1)/constant

tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right" => 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

def constant_dance(direction, tiles_hash)
    tiles_hash[direction]
end


