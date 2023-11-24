# https://adventofcode.com/2015/day/6

#inputfilename = "./test-input.txt"        #test input file
inputfilename = "./prod-input.txt"        #prod input file
debug = 1 > 2
debug_input = 1 > 2
input = File.readlines(inputfilename)

puts input if debug_input 

grid = Array.new(1000) { Array.new(1000,0) }

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
    instructions = parse_line(line)
    p instructions if debug
    startX,startY = instructions[1].split(',')
    endX,endY = instructions[2].split(',')
    (startX.to_i ..endX.to_i).each do |x| 
        (startY.to_i .. endY.to_i).each do |y|
            case instructions[0]
                when "on"
                    grid[x][y] = 1
                when "off"
                    grid[x][y] = 0
                when "toggle"
                    grid[x][y] = (grid[x][y] - 1).abs()
                else
            end
        end
    end
end

sumOfAllLights = 0
(0..999).each {|x| sumOfAllLights += grid[x].sum}

puts "There are #{sumOfAllLights} lit."