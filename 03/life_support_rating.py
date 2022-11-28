import time
#full_list = open("./input.txt").readlines()    #this method includes the end of line character \n.  next method is preferred
full_list = open('./input.txt').read().splitlines()
input_file = open("./input.txt", "r")
map1s = [0,0,0,0,0,0,0,0,0,0,0,0]           #used to map the occurrences of 1s
map0s = [0,0,0,0,0,0,0,0,0,0,0,0]           #used to map the occurrences of 0s
gamma_rate_list = [0,0,0,0,0,0,0,0,0,0,0,0]  
epsilon_rate_list = [0,0,0,0,0,0,0,0,0,0,0,0]
line_count = 0
def BinaryToDecimal(binary):                #borrowed from: https://www.geeksforgeeks.org/convert-binary-to-string-using-python/?ref=rp
    # Using int function to convert to string  
    string = int(binary, 2)     
    return string

oxygen_list = full_list.copy()
co2_list = full_list.copy()

print("Oxygen List is starting with this many entries:", len(oxygen_list))

for i in range(12):
    map1s = [0,0,0,0,0,0,0,0,0,0,0,0]           #used to map the occurrences of 1s
    map0s = [0,0,0,0,0,0,0,0,0,0,0,0]           #used to map the occurrences of 0s
    oxygen_remove_queue = []                    #Ran into issues removing the items from the list while iterating through the list
    for reading in oxygen_list:                   #read the file line by line to generate the maps of 1s vs. 0s
        line_count += 1
        eval_index = 0
        for x in reading:
            match x:
                case "0":
                    map0s[eval_index] += 1
    #                print("Count of map0s at index: " , eval_index, " is now ", map0s[eval_index])
                case "1":
                    map1s[eval_index] += 1
    #                print("Count of map1s at index: " , eval_index, " is now ", map1s[eval_index])
                case "\n":
                    print("End of line entry: ", line_count)
                case _:
                    print("Instruction in input file could not be handled. Exiting.")
                    input_file.close()
                    exit(99)
            eval_index += 1

    print("The map of 1s is: ", map1s)
    print("The map of 0s is: ", map0s)
    print("Evaluating the index character: ", i)

    remove_count = 0
    for reading in oxygen_list:
        if map1s[i] >= map0s[i]:
            matcher = "1"
        else:
            matcher = "0"
        print("---Evaluating the ", i, " position of entry: ", reading, ", which is character: ", reading[i], " -- which needs to match: ", matcher)
        if reading[i] != matcher:
            #oxygen_list.remove(reading)  #THIS CAUSED ISSUES -- want to understand why!
            oxygen_remove_queue.append(reading)
            remove_count += 1
            print("This entry did not meet the criteria and has been removed: ", reading)
        #time.sleep(1)
            
    print("This many entries were flagged for removal: ", remove_count, ". Remove list length: ", len(oxygen_remove_queue))
    for x in oxygen_remove_queue:
        oxygen_list.remove(x)
    print("The list now has this entry count: ", len(oxygen_list))
    #time.sleep(5)           
    #input("Press enter to continue...")
    print("This is the current list: ", oxygen_list)
    #input("Press enter to continue...")
    
              
for i in range(12):
    if len(co2_list) == 1:
        break
    map1s = [0,0,0,0,0,0,0,0,0,0,0,0]           #used to map the occurrences of 1s
    map0s = [0,0,0,0,0,0,0,0,0,0,0,0]           #used to map the occurrences of 0s
    co2_remove_queue = []                    #Ran into issues removing the items from the list while iterating through the list
    for reading in co2_list:                   #read the file line by line to generate the maps of 1s vs. 0s
        line_count += 1
        eval_index = 0
        for x in reading:
            match x:
                case "0":
                    map0s[eval_index] += 1
    #                print("Count of map0s at index: " , eval_index, " is now ", map0s[eval_index])
                case "1":
                    map1s[eval_index] += 1
    #                print("Count of map1s at index: " , eval_index, " is now ", map1s[eval_index])
                case "\n":
                    print("End of line entry: ", line_count)
                case _:
                    print("Instruction in input file could not be handled. Exiting.")
                    input_file.close()
                    exit(99)
            eval_index += 1

    print("The map of 1s is: ", map1s)
    print("The map of 0s is: ", map0s)
    print("Evaluating the index character: ", i)

    remove_count = 0
    for reading in co2_list:
        if map0s[i] <= map1s[i]:
            matcher = "0"
        else:
            matcher = "1"
        print("---Evaluating the ", i, " position of entry: ", reading, ", which is character: ", reading[i], " -- which needs to match: ", matcher)
        if reading[i] != matcher:
            #oxygen_list.remove(reading)  #THIS CAUSED ISSUES -- want to understand why!
            co2_remove_queue.append(reading)
            remove_count += 1
            print("This entry did not meet the criteria and has been removed: ", reading)
        #time.sleep(1)
            
    print("This many entries were flagged for removal: ", remove_count, ". Remove list length: ", len(co2_remove_queue))
    for x in co2_remove_queue:
        co2_list.remove(x)
    print("The list now has this entry count: ", len(co2_list))
    #time.sleep(5)           
    #input("Press enter to continue...")
    print("This is the current list: ", co2_list)
    #input("Press enter to continue...")

            
print(f"Oxygen list: \t", oxygen_list, "\nCO2 List:\t", co2_list)

int_oxygen = BinaryToDecimal(oxygen_list[0])
int_co2 = BinaryToDecimal(co2_list[0])

print("Oxygen value is: ", int_oxygen)
print("CO2 value is: ", int_co2)

print("The product is: ", int_co2 * int_oxygen)
input_file.close()

