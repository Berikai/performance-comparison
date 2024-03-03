use std::time::{SystemTime, UNIX_EPOCH};

fn get_timestamp() -> u128 {
    let time_now = SystemTime::now();
    let timestamp = time_now.duration_since(UNIX_EPOCH)
        .expect("Time went backwards")
        .as_millis();

    return timestamp;
}

fn main() {  
    // get initial time
    let init_time = get_timestamp();

    // count to 100000
    for i in 0..100000 {
        println!("{}", i);
    }

    // get final time
    let final_time = get_timestamp();

    // print the duration
    println!("It took {:?} milliseconds.", (final_time - init_time))
}