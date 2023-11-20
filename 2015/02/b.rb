#inputfilename = "./test-input.txt"        #test input file
inputfilename = "./prod-input.txt"        #prod input file
debug = 1 < 2
debug_input = 1 > 2
input = File.readlines(inputfilename)

if debug_input 
    puts input
end

l,w,h = 0
total_paper_area = 0
input.each do |line|
    l,w,h = line.split('x').map {|s| s.to_i}
    puts "l: #{l}; w: #{w}; h: #{h}" if debug
    s1 = [l,w,h].sort[0]
    s2 = [l,w,h].sort[1]
    
#    area = [l*h,w*h,l*w].sum * 2 + [l*h,w*h,l*w].min
#    puts "Package area: #{area}" if debug
    total_paper_area += area
end

puts "Total paper needed: #{total_paper_area}"