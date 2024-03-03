# Language Performance Comparison

This test measures the performance for the compiled and interpreted languages, and runtime environments listed below with their default most basic environmental settings.

- C++
- Rust
- Go
- Java
- Python
- Node (JS)
- Deno (JS)
- Bun (JS)

To run the test, you need to have the necessary software development kits for all of the technologies above in your OS.

## Approach

It is not a general speed test. It tries to print numbers counting from 0 to 100000 with the help of for loops in all these languages. So, it actually measures how fast the stdout implementations of all these languages are. The speed of bash script also affects the result. 

## Usage

> It only works on a **GNU/Linux** environment. If you are a Windows user, you can run it with **WSL**.

- Run `start.sh`. 
- It will output the result and create a file named `benchmark_(TIMESTAMP).txt` containing the result.

## Result

**CPU:** *i7-12700H*

> :warning: This is is not a releatable result since this test only measures the stdout capabilities of each environment.

### Example 1

```
C++ took 341 milliseconds.
Rust took 326 milliseconds.
Go took 371 milliseconds.
Java took 542 milliseconds.
Python took 494 milliseconds.
Node took 1155 milliseconds.
Deno took 1082 milliseconds.
Bun took 491 milliseconds.
```

### Fastest to slowest

1. Rust
2. C++
3. Go
4. Bun
5. Python
6. Java
7. Deno
8. Node

### Example 2

```
C++ took 261 milliseconds.
Rust took 291 milliseconds.
Go took 334 milliseconds.
Java took 610 milliseconds.
Python took 485 milliseconds.
Node took 1000 milliseconds.
Deno took 1014 milliseconds.
Bun took 504 milliseconds.
```

### Fastest to slowest

1. C++
2. Rust
3. Go
4. Python
5. Bun
6. Java
7. Node
8. Deno