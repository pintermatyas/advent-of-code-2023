total_sum = 0
file = open("input.txt", "r")
lines = file.readlines()
for line in lines:
    total_number_string = ""
    for char in line:
        if char.isnumeric():
            total_number_string = total_number_string + str(char)
    number_string = total_number_string[0] + total_number_string[-1]
    total_sum += int(number_string)
print(total_sum)