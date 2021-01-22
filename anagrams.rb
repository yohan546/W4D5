def first_anagram?(string1, string2) 

    string1.chars.permutation.to_a.map(&:join).include?(string2)
    # p char_arrays
    # perms = []
    # char_arrays.each do |char_array|
    #     cur_perm = char_array
    #     perms << cur_perm if !perms.include?(cur_perm)
    # end

    # perms.include?(string2) 
end

# first_anagram?("gizmo", "sally")    #=> false
# first_anagram?("elvis", "lives")    #=> true

#first_anagram time and space complexity is O(n! * n) 

def second_anagram?(string1, string2)
    string1.each_char do |char| #Q, does this create new memory?
        if string2.include?(char) 
            string2.slice!(char)
        end
    end
    return string2.empty?
end

# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true

#second_agagram time complexity is O(n*m) and space complexity is O(n) 

def third_anagram?(string1, string2)
    sorted1 = string1.chars.sort.join
    sorted2 = string2.chars.sort.join

    sorted1 == sorted2
end

# p third_anagram?("gizmo", "sally")    #=> false
# p third_anagram?("elvis", "lives")    #=> true

# third_anagram time complexity is O(nlogn) and space complexity is O(n)



def fourth_anagram?(string1, string2)
    return false if string1.length != string2.length
    hash1 = Hash.new(0)
    # hash2 = Hash.new(0)

    
    (0...string1.length).each do |i|
        hash1[string1[i]] += 1
        hash1[string2[i]] -= 1
    end


    # string2.each_char do |char|
    #     #hash2[char] += 1
    #     hash1[char] -= 1
    # end

    # hash1 == hash2
    hash1.all? { |key, value| value == 0 }
end

p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true

# fourth_anagram time complexity is O(n) and space complexity is O(n)