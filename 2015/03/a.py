inputfilename = "./test-input.txt"        #test input file
#inputfilename = "./prod-input.txt"        #prod input file
debug = 1 < 2 
debug_input = 1 > 2
inputfile = open(f'{inputfilename}', "r")
input = [line.strip() for line in inputfile] 
if debug_input: print(input)

def sumlist(list):
    sum = 0
    for x in list:
        sum += int(x)
    return sum


elves = []
for elv in ('\n'.join(input)).split('\n\n'):
    #print(elv)
    elves.append(elv.split("\n"))

if debug: print(elves)

elfvalues = []
for elf in elves:
    elfvalues.append(sumlist(elf))

if debug: print(elfvalues)

winvalue = max(elfvalues)
winner = elfvalues.index(max(elfvalues))
print( "With a winning value of: ", winvalue, ', The winner is elf #: ', winner + 1)