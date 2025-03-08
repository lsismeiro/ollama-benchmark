#!/usr/bin/env bash
# Benchmark using ollama gives rate of tokens per second
# idea taken from https://taoofmac.com/space/blog/2024/01/20/1800

set -e

usage() {
 echo "Usage: $0 [OPTIONS]"
 echo "Options:"
 echo " -h, --help      Display this help message"
 echo " -d, --default   Run a benchmark using some default small models"
 echo " -m, --model     Specify a model to use"
 echo " -c, --count     Number of times to run the benchmark"
 echo " --ollama-bin    Point to ollama executable or command (e.g if using Docker)"
 echo " --markdown      Format output as markdown"
}

# Parse flags passed to program
while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            usage
            exit 0
            ;;
        --ollama-bin)
            ollama_bin="$2"
            shift
            shift
            ;;
        -d|--default)
            default_flag=true
            shift
            ;;
        --markdown)
            markdown=true
            shift
            ;;
        -m|--model)
            model="$2"
            shift
            shift
            ;;
        -c|--count)
            benchmark="$2"
            shift
            shift
            ;;
        *)
            echo "Unknown option: $1"
            usage
            exit 1
            ;;
    esac
done

if [ -z "$ollama_bin" ]; then
    ollama_bin="ollama"
fi

base_cmd=$(echo "$ollama_bin" | awk '{print $1}')
if ! command -v "$base_cmd" &> /dev/null; then
    echo "Error: $base_cmd could not be found. Please check the path or install it."
    exit 1
fi

# Original comment about defaults mentions running multiple models that fit
# into memory, but for simplicity and ease of replication I just picked one.
if [ "$default_flag" = true ]; then
    benchmark=3
    model="llama3.2:3b"
fi

if [ -z "$benchmark" ]; then
    echo "How many times to run the benchmark?"
    read -r benchmark
fi

if [ -z "$model" ]; then
    echo "Current models available locally"
    echo ""
    $ollama_bin list
    echo ""
    echo "Enter model you'd like to run (e.g. llama3.2)"
    echo ""
    read -r model
fi

echo -e "Running benchmark $benchmark times using model: $model"
echo ""
if [ "$markdown" = true ]; then
    echo "| Run | Eval Rate (Tokens/Second) |"
    echo "|-----|-----------------------------|"
fi

total_eval_rate=0
for run in $(seq 1 "$benchmark"); do
    if [ "$ollama_bin" != "ollama" ];
    then
        result=$($ollama_bin run "$model" --verbose "Why is the blue sky blue?" | grep "^eval rate:")
    else
        result=$($ollama_bin run "$model" --verbose "Why is the blue sky blue?" 2>&1 >/dev/null | grep "^eval rate:")
    fi
    # With this we could clean up the non-Markdown results a bit more, but leaving it as is for compatibility.
    eval_rate=$(echo "$result" | awk '{print $3}')
    total_eval_rate=$(echo "$total_eval_rate + $eval_rate" | bc -l)
    if [ "$markdown" = true ]; then
        echo "| $run | $eval_rate tokens/s |"
    else
        echo "$result"
    fi
done

average_eval_rate=$(echo "scale=2; $total_eval_rate / $benchmark" | bc)
if [ "$markdown" = true ]; then
    echo "|**Average Eval Rate**| $average_eval_rate tokens/second |"
else
    echo "Average Eval Rate: $average_eval_rate tokens/second"
fi
