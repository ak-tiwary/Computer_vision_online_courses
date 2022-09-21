import cv2 as cv
def destroyAllWindows():
    """cv.destroyALLWindows doesn't work the way I would like, and in Macs 
    calling the following sequence of commands closes the window nicely."""
    cv.waitKey(1)
    cv.destroyAllWindows()
    cv.waitKey(1)  
    cv.destroyAllWindows()
    