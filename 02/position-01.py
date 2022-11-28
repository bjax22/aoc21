import time
pos_file = open("./input.txt", "r")
hPos = int(0) # set horizotal position to 0
vPos = int(0) # set vertical position to 0

for line in pos_file:                   #read the file line by line
    instruction = line.rsplit(" ")      #split the line using space delimiter
    print("Instruction: " , instruction[0] , ", " , instruction[1])
    match instruction[0]:
        case "forward":
            hPos += int(instruction[1])
#            print("New horizontal position: " , hPos)
        case "down":
            vPos += int(instruction[1])
#            print("New vertical position: " , vPos)
        case "up":
            vPos -= int(instruction[1])
#            print("New vertical position: " , vPos)
        case _:
            print("Instruction in input file could not be handled. Exiting.")
            pos_file.close()
            exit(99)
    print("Current position: ", hPos, "," , vPos)
#    time.sleep(1)


pos_file.close()
exit(0)
