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

#print(elves)

elfvalues = []
for elf in elves:
    elfvalues.append(sumlist(elf))

#print(elfvalues)

top3list = elfvalues.copy()
total = 0
for x in range(3):
    total += max(top3list)
    print("Current max: ", max(top3list))
    top3list.remove(max(top3list))

print("Total of top 3: ", total)
