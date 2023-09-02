

for var in '$@'
do
	echo "Running $var on test cases"
	for i in $(seq 3)
	do
		echo "Running test case $i:"
		cat input$i.txt | gcc $var > user_ouput$i.txt
		echo "User output"
		cat user_ouput$i.txt
		echo "Expected output: "
		cat output$i.txt
		echo "---------------------------------------------------"
	done
	echo "========================================================"
done


