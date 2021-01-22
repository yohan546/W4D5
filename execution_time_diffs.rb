def my_min(arr)
    # is_min = true
    # first_num = 0
    # (0...arr.length).each do |i|
    #     is_min = true
    #     (0...arr.length).each do |j|
    #         first_num = arr[i]
    #         rest_nums = arr[j]

    #         if first_num <= rest_nums
    #             next
    #         else
    #             is_min = false
    #         end
    #     end
    #     return first_num if is_min
    # end


    min = arr[0]
    arr.each do |num|
        min = num if num < min
    end
    min
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5

# time complexity of phase 1 is O(n^2)
# time complexity of phase 2 is O(n)

def largest_contiguous_subsum(arr)
    # all_subarrays = []
    # (0...arr.length).each do |i|
    #     (i...arr.length).each do |j|
    #         all_subarrays << arr[i..j]
    #     end
    # end
    
    # all_subarrays.max { |a,b| a.sum <=> b.sum }.sum

    largest_sum = arr[0]
    current_sum = 0
    (0...arr.length).each do |i|
        current_sum += arr[i]
        if current_sum > largest_sum
            largest_sum = current_sum
        end
        if current_sum < 0
            current_sum = 0
        end
    end
    largest_sum
end

list = [-5, -1, -3]
p largest_contiguous_subsum(list) # => -1 (from [-1])

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])