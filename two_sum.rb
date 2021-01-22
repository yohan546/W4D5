def bad_two_sum?(arr, target)
    (0...arr.length).each do |i|
        (i+1...arr.length).each do |j|
            return true if arr[i] + arr[j] == target
        end
    end
    false
end

# arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

# bad_two_sum? time complexity => O(n^2) and space complexity => none

def okay_two_sum?(arr, target)
    sorted = arr.sort

    left = 0
    right = arr.length - 1 

    while left < right 
        sum = arr[left] + arr[right]

        if sum == target
            return true
        elsif sum < target 
            left += 1 # makes sum bigger
        else
            right -= 1 # makes sum smaller
        end
    end

    false
end

# target = 6
# [[0],1,5,[7]]
# 7 > 6
# [[0],1,[5],7]
# 5 < 6
# [0,[1],[5],7]
# 6 = 6

# arr = [0, 1, 5, 7]
# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false

# okay_two_sum?, time complexity => O(n *logn), space complexity => O(n)

def hash_two_sum?(arr, target)
    hash = Hash.new

    arr.each do |ele|
        return true if hash.has_key?(target - ele)
        hash[ele] = 0
    end

    false
end

# target = 6
# array = [0,1,5,7]
# hash = {}

# {0:0, 1:0, return true}

# arr = [0, 1, 5, 7]
# p hash_two_sum?(arr, 6) # => should be true

# ele = 0
# hash.has_key?(6 - 0) = false
# hash = {0:0}

# ele = 1
# hash.has_key?(6 - 1) = false
# hash{0:0,1:0}

# ele = 5
# hash.has_key?(6-5) = true 
# return true





p hash_two_sum?(arr, 10) # => should be false