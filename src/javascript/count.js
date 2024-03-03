// get initial time
const init_time = Date.now()

// count to 100000
for(let i = 0; i < 100000; i++) { 
    console.log(`${i}`)
}

// get final time
const final_time = Date.now()

// print the duration
console.log(`It took ${final_time - init_time} milliseconds.`)