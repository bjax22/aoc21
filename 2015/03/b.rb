inputfilename = "./test-input.txt"        #test input file
#inputfilename = "./prod-input.txt"        #prod input file
debug = 1 > 2
debug_input = 1 > 2
input = File.readlines(inputfilename)

puts input if debug_input 
