import cv2
from cv2 import dnn_superres

# Create an SR object
sr = dnn_superres.DnnSuperResImpl_create()

# Read image
image = cv2.imread('FILTERED.png')
height, width, _ = image.shape

# Read the desired model
path = "EDSR_x4.pb"
sr.readModel(path)

# Set the desired model and scale to get correct pre- and post-processing
sr.setModel("edsr", 4)

result = sr.upsample(image)
resized_image = cv2.resize(result, (width, height))

# Save the enhanced image
#cv2.imwrite("UPSCALED.png",result)
cv2.imwrite("ENHANCED.png",resized_image)
