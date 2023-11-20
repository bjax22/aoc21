#inputfilename = "./test-input.txt"        #test input file
inputfilename = "./prod-input.txt"        #prod input file
debug = 1 < 2
debug_input = 1 > 2
input = File.readlines(inputfilename)

if debug_input 
    puts input
end

l,w,h = 0
total_ribbon_needed = 0
input.each do |line|
    l,w,h = line.split('x').map {|s| s.to_i}
    puts "l: #{l}; w: #{w}; h: #{h}" if debug
    ribbon_length = [[l,w,h].sort[0] * 2,[l,w,h].sort[1] * 2].sum
    cubic_volume = l*w*h
#    area = [l*h,w*h,l*w].sum * 2 + [l*h,w*h,l*w].min
    puts "Ribbon length: #{ribbon_length}; Cubic volume: #{cubic_volume}" if debug
    total_ribbon_needed += [ribbon_length, cubic_volume].sum

end

puts "Total ribbon needed: #{total_ribbon_needed}"