import time
pos_file = open("./input.txt", "r")
hPos = int(0) # set horizotal position to 0
vPos = int(0) # set vertical position to 0
aim = int(0) # set initial aim value

for line in pos_file:                   #read the file line by line
    instruction = line.rsplit(" ")      #split the line using space delimiter
    print("Instruction: " , instruction[0] , ", " , instruction[1])
    match instruction[0]:
        case "forward":
            hPos += int(instruction[1])
            vPos += (int(instruction[1]) * aim)
#            print("New horizontal position: " , hPos)
        case "down":
            aim += int(instruction[1])
#            print("New vertical position: " , vPos)
        case "up":
            aim -= int(instruction[1])
#            print("New vertical position: " , vPos)
        case _:
            print("Instruction in input file could not be handled. Exiting.")
            pos_file.close()
            exit(99)
    print("Current position: ", hPos, "," , vPos , ".  Aim: ", aim)
#    time.sleep(1)


pos_file.close()
exit(0)
