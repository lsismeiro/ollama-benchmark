#!/bin/bash
# Benchmark using ollama gives rate of tokens per second
# idea taken from https://taoofmac.com/space/blog/2024/01/20/1800

set -e

# TODO: Default options for ease of comparison, like `./obench.sh -d`.
# This should download a few models which will fit in memory on the device
# under test, and run them each 3 times, and print the average for each model.

echo "How many times to run the benchmark?"
read benchmark

echo "Current models available locally"
echo ""
ollama list
echo ""
echo "Enter model you'd like to run (e.g. llama3.2)"
echo ""
read model
echo ""

echo -e "Running benchmark "$benchmark" times using model: "$model
echo ""
for run in $(seq 1 $benchmark);
do echo "Why is the blue sky blue?" | ollama run $model --verbose 2>&1 >/dev/null | grep "^eval rate:" ;
done

# TODO: Average the three results, maybe still display them as they are output.
