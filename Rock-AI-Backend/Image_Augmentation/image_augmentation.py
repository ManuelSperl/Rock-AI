import imgaug.augmenters as iaa
import cv2
import glob
import os

# https://imgaug.readthedocs.io/en/latest/

# how often the same image should be augmented
number_of_copies = 1

print("image augmentation start")

# Image Augmentation
augmentation = iaa.Sequential([

    # rotate image
    iaa.Rotate((-30, 30)),

    # Flip (number is the percentage of images, which will be flipped)
    iaa.Fliplr(0.5),  # horizontal
    # iaa.Flipud(0.5),

    # Affine
    # iaa.Affine(translate_percent={"x": (-0.2, 0.2), "y": (-0.2, 0.2)},
    #           rotate=(-30, 30),
    #           scale=(0.5, 1.5)),

    # Multiply (make image brighter or darker)
    iaa.Multiply((0.7, 1.3)),

    # Linearcontrast
    iaa.LinearContrast((0.6, 1.4)),

    # Perform methods below only sometimes
    iaa.Sometimes(0.5,
                  # GaussianBlur
                  iaa.GaussianBlur((0.0, 3.0))
                  )
])

# Load Dataset
images_path = glob.glob("../API_Requests/images/*.jpeg")

# store the path of every image
for img_path in images_path:
    img = cv2.imread(img_path)
    image_name = img_path.split("/")[-1]

    for i in range(0, number_of_copies):
        img_name = image_name.split('.')[0]
        img_type = image_name.split('.')[1]

        if not(os.path.isfile(f'images/{img_name}_{i}.{img_type}')):
            print(f'augment image {image_name}')
            augmented_image = augmentation(image=img)

            # store images locally
            cv2.imwrite(f'images/{img_name}_{i}.{img_type}', augmented_image)

            # Show images
            # cv2.imshow("Image", img)
            # cv2.waitKey(0)
