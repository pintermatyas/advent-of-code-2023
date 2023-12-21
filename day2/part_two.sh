total_power=0

while IFS= read -r input_line; do
    minimal_blue_count=0
    minimal_green_count=0
    minimal_red_count=0

    blue_counts=$(echo "$input_line" | grep -oE '[0-9]+ blue' | awk '{print $1}')
    green_counts=$(echo "$input_line" | grep -oE '[0-9]+ green' | awk '{print $1}')
    red_counts=$(echo "$input_line" | grep -oE '[0-9]+ red' | awk '{print $1}')

    for count in $blue_counts; do
        if [ "$count" -gt $minimal_blue_count ]; then
            minimal_blue_count=$count
        fi
    done

    for count in $green_counts; do
        if [ "$count" -gt $minimal_green_count ]; then
            minimal_green_count=$count
        fi
    done

    for count in $red_counts; do
        if [ "$count" -gt $minimal_red_count ]; then
            minimal_red_count=$count
        fi
    done

    power=$((minimal_blue_count*minimal_green_count*minimal_red_count))
    ((total_power+=power))

done < input.txt

echo $total_power
