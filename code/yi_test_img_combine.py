import cv2
import numpy as np

img1_path = './1.jpg'
img2_path = './2.jpg'
img3_path = './3.jpg'
img4_path = './4.jpg'
path_AB = './5.jpg'
img1 = cv2.imread(img1_path,cv2.IMREAD_COLOR)
img2 = cv2.imread(img2_path,cv2.IMREAD_COLOR)
img3 = cv2.imread(img3_path,cv2.IMREAD_COLOR)
img4 = cv2.imread(img4_path,cv2.IMREAD_COLOR)
im_A0A1 = np.concatenate([img1, img2], 1)
im_A2B = np.concatenate([img3, img4], 1)
four_combine = np.concatenate([im_A0A1, im_A2B], 0)
cv2.imwrite(path_AB, four_combine)
