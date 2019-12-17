import numpy as np



# Parameters
dt = 1  # time step
n_agents = 5    # number of agents
k = 1   # K
w_mul = 0.1 # w multiplier

ang_speed = w_mul * np.random.rand(n_agents)    # w
ang = 2 * np.pi * np.random.rand(n_agents)


