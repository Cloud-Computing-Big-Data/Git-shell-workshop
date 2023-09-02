#!/usr/bin/env bash
# Task 1: 
# The first argument provided from cmd must be the language you are running it in
# Just plainly print the first argument that was provided 
# The second argument is the name of the python/C file that must be run 
# Run the python file, using input1.txt as stdin, and write the output to a file user_output1.txt 
# Display user_output1.txt to the user as user output, and the file output1.txt as the expected output 
# Once you have tested out the script and verified it's working, commit it to a branch: <your_name>

language=$1
echo "The language passed as argument is $language"

cat input1.txt | python3 $2 > user_output1.txt
echo "User output: "
cat user_output1.txt
echo "Expected output: "
cat output1.txt

# Task 2
for var in "$@"
do
    echo "Running $var on test cases"
    for i in $(seq 3)
    do
        echo "Running test case $i:"
        cat input$i.txt | python3 $var > user_output$i.txt
        echo "User output: "
        cat user_output$i.txt
        echo "Expected output: "
        cat output$i.txt
        echo "----------------------------------------------------------------------"
    done
    echo "=========================================================================="
done

# Task 3
for var in "$@"
do
    echo "Running file $var on test cases"
    for i in $(seq 3)
    do
        echo "Running test case $i:"
        cat input$i.txt | python3 $var > user_output$i.txt
        cmp -s output$i.txt user_output$i.txt
        b=`echo $?`
        if [ $b -eq 1 ]
        then
            echo "Test case $i failed"
            echo "User output: "
            cat user_output$i.txt
            echo "Expected output: "
            cat output$i.txt
        else
            echo "Test case $i passed"
        fi
        echo "----------------------------------------------------------------------"
    done
    echo "=========================================================================="
done

# Task 4
for var in "$@"
do
    echo "Running test cases  on file $var"
    for i in $(seq 3)
    do
        echo "Running test case $i"
        cat input$i.txt | python3 $var > user_output$i.txt 2>error.txt
        status=$?
        if [ $status -ne 0 ]
        then
            echo "Code has run-time errors"
            cat error.txt
        else
            echo "Code ran without run-time errors"
            cmp -s output$i.txt user_output$i.txt
            b=$?
            if [ $b -eq 1 ]
            then
                echo "Test case $i failed"
                echo "User output:"
                cat user_output$i.txt
                echo "Expected output:"
                cat output$i.txt
            else
                echo "Test case $i passed"
            fi
        fi
        echo "----------------------------------------------------------------------------------"
    done
    echo "=================================================================================="
done


# Task 5
language=$1
echo "The language passed as argument is $language"
check="python"
if [ "$language" = "$check" ]
then
    echo "Language verified"
    for  var in "$@"
    do
        echo $var
        if [ "$var" = "$check" ]
        then
            continue
        fi
        echo "Running test cases on file $var"
        for i in $(seq 2 4)
        do
            n=1
            x=`expr $i - $n`
            echo "Running test case $x"
            cat input$x.txt | python3 $var > user_output$x.txt 2>error.txt
            status=$?
            if [ $status -ne 0 ]
            then
                echo "Code has run-time errors"
                cat error.txt
            else
                echo "Code ran without run-time errors"
                cmp -s output$x.txt user_output$x.txt
                b=$?
                if [ $b -eq 1 ]
                then
                    echo "Test case $x failed"
                    echo "User output:"
                    cat user_output$x.txt
                    echo "Expected output:"
                    cat output$x.txt
                else
                    echo "Test case $x passed"
                fi
            fi
            echo "----------------------------------------------------------------------------------"
        done
        echo "=================================================================================="
    done
else
    echo "Invalid language"
fi