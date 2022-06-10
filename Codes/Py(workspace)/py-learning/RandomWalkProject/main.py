import matplotlib.pyplot as plt

from Random_work import RandomWalk

while True:

    rw = RandomWalk()
    rw.fill_walk()

    point_numbers = list(range(rw.num_points))
    plt.scatter(rw.x_values, rw.y_values, s=4, c=point_numbers, cmap=plt.cm.Blues)
    plt.show()

    keep_running = input("Continue?\n")
    if keep_running == 'n':
        break
