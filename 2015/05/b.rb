#inputfilename = "./test-input2.txt"        #test input file
inputfilename = "./prod-input.txt"        #prod input file
debug = 1 < 2
debug_input = 1 > 2
input = File.readlines(inputfilename)

puts input if debug_input 

arrNaughty = Array.new
arrNice = Array.new

def find_repeating_pair(string)
    #string[/(\w\w)(\1+)/i]
    string[/(?=(\w{2}).*?\1)/i]
end

def find_split_repeats(string)
    string[/(\w)\w\1/i]
end

input.each do |str|
    if not find_repeating_pair(str)
        arrNaughty.push(str)
        puts "#{str} was found to be naughty due to repeating pair rule." if debug
        next
    end
    if not find_split_repeats(str)
        arrNaughty.push(str)
        puts "#{str} was found to be naughty due to split repeat rule." if debug
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