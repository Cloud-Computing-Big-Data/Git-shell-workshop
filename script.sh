#!/usr/bin/env bash
# Task 1: 
# The first argument provided from cmd must be the language you are running it in
# Just plainly print the first argument that was provided 
# The second argument is the name of the python/C file that must be run 
# Run the python file, using input1.txt as stdin, and write the output to a file user_output1.txt 
# Display user_output1.txt to the user as user output, and the file output1.txt as the expected output 

language=$1
echo "The language passed as argument is $language"

cat input1.txt | python3 $2 > user_output1.txt 
echo "User output: " 
cat user_output1.txt 
echo "Expected output: " 
cat output1.txt 

# Task 2: 
# The first line is no longer the language. 
# However, multiple files are provided as command line inputs.  
# Using a for loop, iterate through the remaining arguments, and run each file that has been passed as a command line argument 
# Additionally, you have to also iteratively execute each file on multiple test cases 
# Run each file: ex file.py on 3 input files: input1.txt, input2.txt, input3.txt, and store them in output files: user_output1.txt user_output2.txt user_output3.txt. For each iteration, display the expected output and the user output. You can hard-code ONLY the NUMBER of test cases. 
# After you have tested it, commit your changes to your branch 
