import time
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


for line in input_file:                   #read the file line by line
    line_count += 1
    eval_index = 0
    for x in line:
        match x:
            case "0":
                map0s[eval_index] += 1
                print("Count of map0s at index: " , eval_index, " is now ", map0s[eval_index])
            case "1":
                map1s[eval_index] += 1
                print("Count of map1s at index: " , eval_index, " is now ", map1s[eval_index])
            case "\n":
                print("End of line entry")
            case _:
                print("Instruction in input file could not be handled. Exiting.")
                input_file.close()
                exit(99)
        eval_index += 1
        #time.sleep(0.5)
    print("Finished processing line number: ", line_count)

print("The map of 1s is: ", map1s)
print("The map of 0s is: ", map0s)
    
for i in range(len(map1s)):
    if map1s[i] > map0s[i]:
        gamma_rate_list[i] = "1"
        epsilon_rate_list[i] = "0"
    else:
        gamma_rate_list[i] = "0"
        epsilon_rate_list[i] = "1"

str_gamma_rate = ''.join(gamma_rate_list)
str_epsilon_rate = ''.join(epsilon_rate_list)

print("Gamma rate is: \t\t", gamma_rate_list, "; concatenated to: ", str_gamma_rate)
print("Epsilon rate is: \t", epsilon_rate_list, "; concatenated to: ", str_epsilon_rate)

int_gamma_rate = BinaryToDecimal(str_gamma_rate)
int_epsilon_rate = BinaryToDecimal(str_epsilon_rate)

print("Gamma rate is: ", int_gamma_rate)
print("Epsilon rate is: ", int_epsilon_rate)
input_file.close()

