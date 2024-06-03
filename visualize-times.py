import matplotlib.pyplot as plt

# all numbers are hard-coded

sizes = [1000, 100000, 10000000]
gen_time = [0.016, 1.315, 125.702]
sort_time = [0.038, 0.104, 17.720]

plt.plot(sizes, gen_time)
plt.plot(sizes, sort_time)
plt.show()