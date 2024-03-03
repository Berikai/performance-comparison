#!/bin/bash

# prevent running as root to avoid any possible system damage
if [ "$EUID" -eq 0 ] 
then 
  echo "Please don't run as root!"
  exit
fi

# elementary vars
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
TIMESTAMP=$( date +%s )

# init
echo "Language Performance Comparison"
echo "Benchmark will start in 3 seconds..."
sleep 3

# remove previously compiled binaries if there are any
if test -d $SCRIPT_DIR/bin; then
  rm -r $SCRIPT_DIR/bin
fi

# re-create dirs
mkdir $SCRIPT_DIR/bin
mkdir $SCRIPT_DIR/bin/cpp
mkdir $SCRIPT_DIR/bin/rust
mkdir $SCRIPT_DIR/bin/go
mkdir $SCRIPT_DIR/bin/java

# compile
g++ $SCRIPT_DIR/src/cpp/count.cpp -o $SCRIPT_DIR/bin/cpp/count.bin
rustc $SCRIPT_DIR/src/rust/count.rs -o $SCRIPT_DIR/bin/rust/count.bin
go build -o $SCRIPT_DIR/bin/go/count.bin $SCRIPT_DIR/src/go/count.go
javac $SCRIPT_DIR/src/java/count.java -d $SCRIPT_DIR/bin/java

# function to run and measure the time of program
run_app() {
    init_time=$( date +%s%N | cut -b1-13 )
    $2
    final_time=$( date +%s%N | cut -b1-13 )

    echo $1 took $(( $final_time - $init_time )) milliseconds. >> $SCRIPT_DIR/benchmark_$TIMESTAMP.txt
}

# run benchmark
# compiled langs
run_app C++ $SCRIPT_DIR/bin/cpp/count.bin
run_app Rust $SCRIPT_DIR/bin/rust/count.bin
run_app Go $SCRIPT_DIR/bin/go/count.bin
run_app Java "java -classpath $SCRIPT_DIR/bin/java count"

# interpreted langs
run_app Python "python $SCRIPT_DIR/src/python/count.py"
run_app Node "node $SCRIPT_DIR/src/javascript/count.js"
run_app Deno "deno run $SCRIPT_DIR/src/javascript/count.js"
run_app Bun "bun $SCRIPT_DIR/src/javascript/count.js"

# print the benchmark result
echo Done!
cat $SCRIPT_DIR/benchmark_$TIMESTAMP.txt