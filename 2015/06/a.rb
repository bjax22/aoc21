inputfilename = "./test-input.txt"        #test input file
#inputfilename = "./prod-input.txt"        #prod input file
debug = 1 > 2
debug_input = 1 > 2
input = File.readlines(inputfilename)

puts input if debug_input 

# grid = Array.new(1000) { Array.new(1000,0) }

def parse_line(line)
    words = line.split
    if words[0] == "toggle"
        command = words[0]
        fBulb = words[1]
        lBulb = words[-1]
    else
        command = words[1]
        fBulb = words[2]
        lBulb = words[-1]
    end
    returnArr = [command,fBulb,lBulb]
end

#########
# MAIN
#########
input.each do |line|
    inst = parse_line(line)
    p inst
end
