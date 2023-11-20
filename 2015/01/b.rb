#inputfilename = "./test-input.txt"        #test input file
inputfilename = "./prod-input.txt"        #prod input file
debug = 1 > 2
debug_input = 1 > 2
input = File.read(inputfilename)

if debug_input 
    puts input
end

chars = input.split('')
puts chars if debug

floor = 0
basement_index = 0
chars.each_with_index do |char,idx|
    floor += 1 if char == "("
    floor -= 1 if char == ")"
    if floor == -1 then
        basement_index = idx
        break
    end
end

puts "Found basement at index: #{basement_index}; plus 1 = #{basement_index + 1}"