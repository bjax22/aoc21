#inputfilename = "./test-input.txt"        #test input file
inputfilename = "./prod-input.txt"        #prod input file
debug = 1 > 2
debug_input = 1 > 2
input = File.read(inputfilename)

puts input if debug_input 

x1,y1 = 0,0
x2,y2 = 0,0
puts "X: #{x}; Y: #{y}" if debug

chars = input.split('')
#puts chars if debug

#arrLocations = ([x,y])
arrLocations = Array.new
arrLocations2 = Array.new
arrLocations.push([x1,y1])
arrLocations2.push([x2,y2])
chars.each_with_index do |char,idx|
    if idx.even? 
        case char
            when '^'
                y1 += 1
            when 'v'
                y1 -= 1
            when '<'
                x1 -= 1
            when '>'
                x1 += 1
            else
                puts "Illegal character: #{char}"
                exit(99)
        end
        arrLocations.push([x1,y1])
    else 
        case char
            when '^'
                y2 += 1
            when 'v'
                y2 -= 1
            when '<'
                x2 -= 1
            when '>'
                x2 += 1
            else
                puts "Illegal character: #{char}"
                exit(99)
        end
        arrLocations2.push([x2,y2])
    end

    #puts "Char: #{char}; Current Coordinates: (#{x},#{y})" if debug
    
    p arrLocations if debug #p is a helpful debug function for printing arrays: https://stackoverflow.com/questions/7478300/how-do-i-print-a-multi-dimensional-array-in-ruby

end

p arrLocations
p arrLocations2
p arrLocations.tally.count
p arrLocations2.tally.count

allLocations = arrLocations + arrLocations2
p allLocations.tally
p allLocations.tally.count