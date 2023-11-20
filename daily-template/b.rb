inputfilename = "./test-input.txt"        #test input file
#inputfilename = "./prod-input.txt"        #prod input file
debug = 1 > 2
debug_input = 1 > 2
input = File.readlines(inputfilename)

if debug_input 
    puts input
end