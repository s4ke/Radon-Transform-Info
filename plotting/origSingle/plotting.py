import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
import numpy as np
import math

def L(s, alpha, z):
    return s * np.array([np.cos(alpha), np.sin(alpha)]) + z * np.array([-np.sin(alpha), np.cos(alpha)])

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

def inRect(bottomLeft, topRight, origin, angle, point):
    bLeft = bottomLeft
    tRight = topRight
    pt = rotate(origin, point, -angle)
    ret = pt[0] >= bLeft[0] and pt[1] >= bLeft[1] \
            and pt[0] <= tRight[0] and pt[1] <= tRight[1]
    return ret

    
i = 0
for alpha in np.linspace(-np.pi, np.pi, 100):
    fig = plt.figure()
    plt.xlabel('x')
    plt.ylabel('y')

    axes = plt.gca()
    axes.add_artist(mpatches.RegularPolygon((50, 50), 4, 50, alpha - np.pi/4 , color='white', ec='black'))
    axes.add_artist(mpatches.RegularPolygon((50, 50), 6, 30, np.pi/2, color='white', ec='black'))
    axes.add_artist(plt.Circle((40, 40), 5, color='black'))
    axes.add_artist(plt.Circle((60, 60), 5, color='black'))
    axes.set_xlim([0,100])
    axes.set_ylim([0,100])
    
    for s in np.linspace(-100, -40, 10):
        actualL = [L(s, alpha, z) for z in np.linspace(-300, 300, 600)]
        actualLFiltered = [val for val in actualL if inRect((15, 15), (85, 85), (50, 50), alpha, val)]
        XS = [val[0] for val in actualLFiltered]
        YS = [val[1] for val in actualLFiltered]
        plt.plot(XS, YS, color='grey')
        #plt.axhline(0, color='black')
        #plt.axvline(0, color='black')
        
    strg = str(i)
    if(len(strg) == 1):
        strg = "0" + strg
    
    plt.savefig(strg + ".png")
    i = i + 1
    plt.close()
    
