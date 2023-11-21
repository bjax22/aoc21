#inputfilename = "./test-input.txt"        #test input file
inputfilename = "./prod-input.txt"        #prod input file
debug = 1 < 2
debug_input = 1 > 2
input = File.readlines(inputfilename)

puts input if debug_input 

arrNaughty = Array.new
arrNice = Array.new

def count_vowels(string)
    string.count('aeiou')
end

def find_consecutive_chars(string)
    string[/(\w)(\1+)/i]
end

input.each do |str|
    if str[/ab|cd|pq|xy/i]
        arrNaughty.push(str)
        puts "#{str} was found to be naughty due to ab/cd/pq/xy rule." if debug
        next
    end
    if count_vowels(str) < 3
        arrNaughty.push(str)
        puts "#{str} was found to be naughty due to vowel counter rule." if debug
        next
    end
    if not find_consecutive_chars(str)
        arrNaughty.push(str)
        puts "#{str} was found to be naughty due to consecutive character rule." if debug
        next
    end
    arrNice.push(str)
    puts "#{str} was found to be nice.  There are now #{arrNice.count} nice strings and #{arrNaughty.count} naughty strings" if debug
end

puts "---------------------------"
puts "------  FINAL OUTPUT ------"
puts "---------------------------"
puts "#{arrNaughty.count} naughty strings"
puts "#{arrNice.count} nice strings"


#It does not contain the strings ab, cd, pq, or xy, even if they are part of one of the other requirements.