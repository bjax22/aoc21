require 'digest'

#inputfilename = "./test-input.txt"        #test input file
inputfilename = "./prod-input.txt"        #prod input file
debug = 1 < 2
debug_input = 1 > 2
input = File.read(inputfilename)

puts input if debug_input 

counter = 0
loop do 
    counter += 1
    hash_this = input + counter.to_s
    output = Digest::MD5.hexdigest hash_this
    puts "counter: #{counter}; hash_this: #{hash_this}; hash: #{output}" if debug
    break if output[0..5] == "000000"
end

