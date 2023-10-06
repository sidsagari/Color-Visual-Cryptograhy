import cv2

# Load the model for super-resolution
path = "EDSR_x4.pb"
superres = cv2.dnn_superres.DnnSuperResImpl_create()
superres.readModel(path)
superres.setModel("edsr", 4)

# Set the backend to CUDA if available
if cv2.dnn.cuda.getCudaEnabledDeviceCount() > 0:
    superres.setPreferableBackend(cv2.dnn.DNN_BACKEND_CUDA)
    superres.setPreferableTarget(cv2.dnn.DNN_TARGET_CUDA)

# Read the image
image = cv2.imread('paradise_FILTERED.png')
height, width, _ = image.shape

# Upscale the image using the super-resolution model
result = superres.upsample(image)
resized_image = cv2.resize(result, (width, height))

# Save the enhanced image
cv2.imwrite("paradise_UPSCALED.png", result)
cv2.imwrite("paradise_ENHANCED.png", resized_image)
