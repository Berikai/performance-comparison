#include <iostream>
#include <chrono>

int64_t get_timestamp() {
    const auto time_now = std::chrono::system_clock::now();
    const int64_t timestamp = std::chrono::duration_cast<std::chrono::milliseconds>
        (time_now.time_since_epoch()).count();

    return timestamp;
}

int main() {
    // get initial time
    const int init_time = get_timestamp();

    // count to 100000
    for(int i = 0; i < 100000; i++) { 
        std::cout << i << std::endl;
    }

    // get final time
    const int final_time = get_timestamp();

    // print the duration.
    std::cout << "It took " << (final_time - init_time) << " milliseconds." << std::endl;

    return 0;
}