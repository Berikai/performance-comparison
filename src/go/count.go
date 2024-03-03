package main

import (
	"fmt"
	"time"
)

func get_timestamp() int64 {
	time_now := time.Now()
	timestamp := time_now.UnixMilli()

	return timestamp
}

func main() {
	// get initial time
	init_time := get_timestamp()

	// count to 100000
	for i := 0; i < 100000; i++ {
		fmt.Println(i)
	}

	// get final time
	final_time := get_timestamp()

	// print the duration
	fmt.Println(fmt.Sprintf("It took %d milliseconds.", (final_time - init_time)))
}
