import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
import numpy as np
import math

def L(s, alpha, z):
    return s * np.array([np.cos(alpha), np.sin(alpha)]) + z * np.array([-np.sin(alpha), np.cos(alpha)])
    
def zero(a):
    return 0;

def rotate(origin, point, angle):
    """
    Rotate a point counterclockwise by a given angle around a given origin.

    The angle should be given in radians.
    """
    ox, oy = origin
    px, py = point

    qx = ox + math.cos(angle) * (px - ox) - math.sin(angle) * (py - oy)
    qy = oy + math.sin(angle) * (px - ox) + math.cos(angle) * (py - oy)
    return qx, qy
    
def distance(origin, point):
    ox, oy = origin
    px, py = point
    return math.sqrt((ox - px)**2 + (oy - py)**2)
    

i = 0

actualL = [L(0, -np.pi/4, z) for z in np.linspace(-1000, 1000, 10)]

for alpha in np.linspace(-np.pi, np.pi, 100):
    fig = plt.figure()
    plt.axis('off')
    
    axes = plt.gca()
    axes.add_artist(plt.Circle((50, 50), 71, color='white', ec='black'))
    axes.add_artist(mpatches.RegularPolygon((50, 50), 6, 30, np.pi/2, color='white', ec='black'))
    axes.add_artist(plt.Circle((40, 40), 5, color='black'))
    axes.add_artist(plt.Circle((60, 60), 5, color='black'))
    axes.set_xlim([-25, 125])
    axes.set_ylim([-25, 125])
    
    for subAlpha in np.linspace(5*np.pi/8, 7*np.pi/8, 15):
        actualL = [L(0, subAlpha, z) for z in np.linspace(-300, 0, 1000)]
        actualLRotated = [rotate((50, 50), (val[0],val[1]), alpha) for val in actualL]
        actualLRotatedFiltered = [val for val in actualLRotated if distance((50, 50), val) < 71]
        XS = [val[0] for val in actualLRotatedFiltered]
        YS = [val[1] for val in actualLRotatedFiltered]
        plt.plot(XS, YS, color='grey')
        
    strg = str(i)
    if(len(strg) == 1):
        strg = "0" + strg
    
    plt.savefig(strg + ".png")
    i = i + 1
    plt.close()
    
