# Task 1: 
# The first argument provided from cmd must be the language you are running it in
# Just plainly print the first argument that was provided 
# The second argument is the name of the python/C file that must be run 
# Run the python file, using input1.txt as stdin, and write the output to a file user_output1.txt 
# Display user_output1.txt to the user as user output, and the file output1.txt as the expected output 
# Once you have tested out the script and verified it's working, commit it to a branch: <your_name>

language=$1
echo "The language passed as argument is: $1"
echo "User output: "
cp output1.txt user_output1.txt
cat user_output1.txt
echo "The output we got:"
cat input1.txt | python3 $2 > output1.txt
cat output1.txt
