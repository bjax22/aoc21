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
chars.each do |char|
    floor += 1 if char == "("
    floor -= 1 if char == ")"
end

puts floor