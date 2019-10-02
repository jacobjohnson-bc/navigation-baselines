import numpy as np

from sparse_rrt import _sst_module


cdef double normalize_angle(double z):
    cdef double PI= np.pi
    return (z+PI) % (2 * PI) - PI

class TriStateDistance(_sst_module.IDistance):
    """
    Custom distance function for Tricycle robot.
    """
    def distance(self,double[:] point1,double[:] point2):
        return ((point1[0]-point2[0])**2 +(point1[1]-point2[1])**2+ normalize_angle(point1[2]-point2[2])**2 +normalize_angle(point1[5]-point2[5])**2)**0.5
