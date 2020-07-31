def sluggish_octopus(arr)
    max = arr[0]
    arr.each_with_index do |ele, i|
        (i+1..arr.length-1).each do |j|
            if ele < arr[j]
                break
            else
                max = arr[j]
            end
        end
    end
    max
end

def dominant_octopus(arr)
    new_arr = merge_sort(arr)
    new_arr[-1]
end

def merge_sort(arr)
    return arr if arr.length <= 1
    midpoint = arr.length/2
    left = arr[0...midpoint]
    right = arr[midpoint..-1]
    sorted_left = merge_sort(left)
    sorted_right = merge_sort(right)
    merge(sorted_left, sorted_right)
end

def merge(left, right)
    return_arr = []
    until left.empty? || right.empty?
        if left[0].length < right[0].length
            return_arr << left.shift
        else
            return_arr << right.shift
        end
    end
    return_arr + left + right
end

def clever_octopus(arr)
    max = arr[0]
    arr.each {|ele| max = ele if ele.length >max.length}
    max
end

def slow_dance(direction, tiles)
    tiles.each_with_index {|tile, i| return i if direction == tile}
end

def fast_dance(direction, hash)
    hash[direction]
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
new_tiles_data_structure = {}
tiles_array.each_with_index {|ele,i| new_tiles_data_structure[ele] = i}
fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
p sluggish_octopus(fishes)
p dominant_octopus(fishes)
p clever_octopus(fishes)
p slow_dance("up", tiles_array)
p slow_dance("right-down", tiles_array)
p fast_dance("up", new_tiles_data_structure)
p fast_dance("right-down", new_tiles_data_structure)