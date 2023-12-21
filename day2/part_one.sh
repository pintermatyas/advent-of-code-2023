total_id=0

while IFS= read -r input_line; do
    game_id=1
    game_id=$(echo "$input_line" | grep -oE '[0-9]+:' | awk '{sum += $1} END {print sum}')

    blue_counts=$(echo "$input_line" | grep -oE '[0-9]+ blue' | awk '{print $1}')
    green_counts=$(echo "$input_line" | grep -oE '[0-9]+ green' | awk '{print $1}')
    red_counts=$(echo "$input_line" | grep -oE '[0-9]+ red' | awk '{print $1}')

    for count in $blue_counts; do
        if [ "$count" -gt 14 ]; then
            continue 2
        fi
    done

    for count in $green_counts; do
        if [ "$count" -gt 13 ]; then
            continue 2
        fi
    done

    for count in $red_counts; do
        if [ "$count" -gt 12 ]; then
            continue 2
        fi
    done
    ((total_id+=game_id))
done < input.txt

echo $total_id
