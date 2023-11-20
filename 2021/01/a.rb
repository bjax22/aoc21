#inputfilename = "./test-input.txt"        #test input file
inputfilename = "./prod-input.txt"        #prod input file
debug = 1 < 2
debug_input = 1 > 2
input = File.readlines(inputfilename)

if debug_input 
    puts input
end

counter = 0 
previous_value = ""
input.each_with_index {
    |value, idx|
#    puts "Value: #{value} at Index: #{idx}"
    if idx == 0  
#        previous_value = value
#        next
    else
        if value > previous_value then
            counter += 1
        end
#        previous_value = value
    end
    previous_value = value
    if debug then 
        puts "Current value: #{value} || Previous value: #{previous_value} || Counter: #{counter}"
    end
}

puts counter