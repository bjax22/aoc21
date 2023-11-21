#inputfilename = "./test-input.txt"        #test input file
inputfilename = "./prod-input.txt"        #prod input file
debug = 1 > 2
debug_input = 1 > 2
input = File.read(inputfilename)

puts input if debug_input 

x,y = 0,0
puts "X: #{x}; Y: #{y}" if debug

chars = input.split('')
#puts chars if debug

#arrLocations = ([x,y])
arrLocations = Array.new
arrLocations.push([x,y])
chars.each do |char|
    case char
        when '^'
            y += 1
        when 'v'
            y -= 1
        when '<'
            x -= 1
        when '>'
            x += 1
        else
            puts "Illegal character: #{char}"
            exit(99)
    end

    #puts "Char: #{char}; Current Coordinates: (#{x},#{y})" if debug
    arrLocations.push([x,y])
    p arrLocations if debug #p is a helpful debug function for printing arrays: https://stackoverflow.com/questions/7478300/how-do-i-print-a-multi-dimensional-array-in-ruby

end

p arrLocations.tally
p arrLocations.tally.count
