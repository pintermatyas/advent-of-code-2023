total_sum = 0
file = open("input.txt", "r")
lines = file.readlines()

character_digit_map = {('one', 1), ('two', 2), ('three', 3), ('four', 4), ('five', 5), ('six', 6), ('seven', 7), ('eight', 8), ('nine', 9)}

for line in lines:
    total_number_string = ""
    char_idx = 0
    for char in line:
        if char.isnumeric():
            total_number_string = total_number_string + str(char)
        else:
            for char_digit_pair in character_digit_map:
                word_length = len(char_digit_pair[0])
                if line[char_idx:char_idx+word_length] == char_digit_pair[0]:
                    line.replace(char_digit_pair[0], str(char_digit_pair[1]), 1)
                    total_number_string = total_number_string + str(char_digit_pair[1])
        char_idx+=1
    number_string = total_number_string[0] + total_number_string[-1]
    total_sum += int(number_string)
print(total_sum)