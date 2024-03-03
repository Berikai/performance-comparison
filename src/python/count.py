import time

# get initial time
init_time = time.time()

# count to 100000
for i in range(100000):
    print(f"{i}")

# get final time
final_time = time.time()

# print the duration
print(f'It took {int(final_time * 1000) - int(init_time * 1000)} milliseconds.')