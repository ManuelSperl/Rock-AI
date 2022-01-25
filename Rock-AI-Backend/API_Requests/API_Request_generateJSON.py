import requests
import json
import pyrebase
import os
from PIL import Image

"""
-------------------------------------------------------------------------------------------------
---------Only these variables need to be adapted to process the desired output and data.---------
-------------------------------------------------------------------------------------------------
"""

login_url = "https://health.api.makia.ml/login"         # POST-Request to get JWT Token
data_url = "https://health.api.makia.ml/rock"           # GET-Request to get Data from API
image_url = 'https://health.api.makia.ml/rock/image/'   # GET-Request to get a specific picture with the hash-value

# number of the homogenous area from when the images are to be downloaded
from_number_of_hb = 0

# TODO: insert correct username and password
payload = json.dumps({
    "username": ".............",
    "password": "............."
})

# credits for firebase initialization
# TODO: insert right apiKey
credits = {"apiKey": "...........................",
           "authDomain": "rock-ai-us-central1",
           "databaseURL": "https://rock-ai-db.firebaseio.com",
           "storageBucket": "rock-ai-us-central1"
           }

# this can be set as false if the json file 'raw_data.json' exists and then the json data is used for the following processing
DOWNLOAD_DATA_FROM_ROCK_AI_API = False

DOWNLOAD_PICTURES_FROM_API = False
UPLOAD_PICTURES_TO_FIRESTORE = False             # DOWNLOAD_PICTURES_FROM_API = True have to be setted
STORE_PICTURES_LOCALLY = False                # DOWNLOAD_PICTURES_FROM_API = True have to be setted
SAVE_LINK_FROM_EACH_FIRESTORE_PICTURE = False    # Pictures already have to be store in the firebase storage

# to generate the firebase_data.json file, the picture muss be uploaded to the firestore
# and the SAVE_LINK_FROM_EACH_FIRESTORE_PICTURE = True must be setted
GENERATE_FIRESTORE_DATA_JSON = False

GENERATE_SINGLE_LABEL_CSV = True
GENERATE_MULTI_LABEL_CSV = False

# the images have to be store in ../Image_Augmentation/images locally
GENERATE_LABELS_AUGMENTATION_IMAGES = True

PRINT_INTERNAL_DATA_ARRAY = False

"""
-------------------------------------------------------------------------------------------------
"""


# prints the data, which is stored in the internal array
def print_data_array(data_array):
    i = 1
    for hb in data_array:
        print(f'{i} Homogenbereich:')
        print(f'   Gebirgsverhaltenstyp = {hb[0]}')
        print(f'   Vegetationseinfluss  = {hb[1]}')
        print(f'   Gefaehrdungsklasse   = {hb[2]}\n')
        i += 1


# generate the json file of the whole data to upload it to a firebase firestore
def generate_json_string(data_array, image_links):
    i = 0
    json_string = '['
    for hb in data_array:
        if i == 41:
            continue
        json_string += '{"gebirgsverhaltenstyp": "' + hb[0] + '", "vegetationseinfluss": "' + hb[1] \
                       + '", "gefaehrdungsklasse": "' + hb[2] + '", "images": ['
        for img in image_links[i]:
            json_string += '"' + img + '",'

        json_string = json_string[:-1] + ']},'
        i += 1

    json_string = json_string[:-1] + ']'

    # write data into .json file
    with open('firebase_data.json', 'w') as file_object:  # open the file in write mode
        json.dump(json.loads(json_string), file_object)


# creates labels of all pictures in csv-format
def create_lables(imageHash_array, data_array, multilabeling):
    csv_data = []

    for i in range(len(imageHash_array)):
        for j in range(len(imageHash_array[i])):
            img_aug_index = 0

            if i < 10:
                i_string = '0' + str(i)
            else:
                i_string = str(i)
            if j < 10:
                j_string = '0' + str(j)
            else:
                j_string = str(j)

            # with this if, this pictures will be not labeled and are for reserved for testing
            # if not (i == 0 or i == 39 or i == 40 or (i == 13 and j == 0)):
            csv_line = f'gs://rock-ai-us-central1/images/image{i_string}_{j_string}.jpeg,{data_array[i][2]}'

            if multilabeling:
                csv_line += f',{data_array[i][0]},{data_array[i][1]}\n'
            else:
                csv_line += '\n'

            # print(csv_line)
            csv_data.append(csv_line)

            # generate labels for all augmented images
            if GENERATE_LABELS_AUGMENTATION_IMAGES:
                while os.path.isfile(f'../Image_Augmentation/images/image{i_string}_{j_string}_{img_aug_index}.jpeg'):
                    csv_line = f'gs://rock-ai-us-central1/images_augmentation/image{i_string}_{j_string}_{img_aug_index}.jpeg,{data_array[i][2]}'

                    if multilabeling:
                        csv_line += f',{data_array[i][0]},{data_array[i][1]}\n'
                    else:
                        csv_line += '\n'

                    csv_data.append(csv_line)
                    img_aug_index += 1

    filename = "multi_labels.csv" if multilabeling else "single_label.csv"
    csv_file = open(filename, "w")
    csv_file.writelines(csv_data)
    csv_file.close()


"""
-------------------------------------------------------------------------------------------------
-------------------------------------------MAIN METHOD-------------------------------------------
-------------------------------------------------------------------------------------------------
"""
if __name__ == '__main__':
    if DOWNLOAD_DATA_FROM_ROCK_AI_API:
        print("Downloading data from API: ")
        headers = {
            'Content-Type': 'application/json'
        }

        # post request with login data to get jwt-toke for authorization
        jwt_token = requests.request("POST", login_url, headers=headers, data=payload)
        print("JWT-Token for Authorization: ", jwt_token.text)

        headers = {
           'Authorization': 'Bearer ' + jwt_token.text,
           'Content-Type': 'application/json'
        }

        # get the dataset from the API
        data = requests.request("GET", data_url, headers=headers, data=payload)

        # write data into .json file
        with open('raw_data.json', 'w') as file_object:  # open the file in write mode
            json.dump(data.json(), file_object)

        print("Downloading data from API finished!")

    # ----------- store json data into array --------------
    # load request data from local json-file
    json_file = open("raw_data.json")
    json_data_array = json.load(json_file)
    json_file.close()

    # in imageHash_array[1] and imageLink_array[1] are the corresponding images to the data in data_array[1] (same index)
    data_array = []  # ['gebirgsverhaltenstyp', 'vegetationseinfluss', 'gefaehrdungsklasse']
    imageHash_array = []  # [ImageHash 1, ImageHash 2, ...]
    imageLink_array = []  # [Imagelink 1, ImageLink 2, ...]

    i = 0
    for i in range(len(json_data_array)):
        if i == 41: # other data in the array
            continue
        hb = [json_data_array[i]['classificationManually']['gebirgsverhaltenstyp'],
              json_data_array[i]['classificationManually']['vegetationseinfluss'],
              json_data_array[i]['classificationManually']['gefaehrdungsklasse']]
        data_array.append(hb)

        j = 0
        image = []
        for j in range(len(json_data_array[i]['images'])):
            image.append(json_data_array[i]['images'][j])

        imageHash_array.append(image)

    if PRINT_INTERNAL_DATA_ARRAY:
        print_data_array(data_array)

    # ------ get images from API -------------

    # pictures from hb 41 and upwards get downloaded und into firestore uploaded
    for i in range(from_number_of_hb, len(imageHash_array)):
        j = 0
        links = []
        for j in range(len(imageHash_array[i])):
            # downloading pictures from URL
            if DOWNLOAD_PICTURES_FROM_API:
                print(f'Downloading images from API - HB {i}: ', end="")
                image_url += + imageHash_array[i][j]
                image = requests.request("GET", image_url, headers=headers, data=payload)
                print("finished")

            # link: https://github.com/thisbejim/Pyrebase (import, if authentication rules are set)
            firebase = pyrebase.initialize_app(credits)
            storage = firebase.storage()

            # upload image to firestore
            if i < 10:
                i_string = '0' + str(i)
            else:
                i_string = str(i)
            if j < 10:
                j_string = '0' + str(j)
            else:
                j_string = str(j)

            # Upload pictures
            if UPLOAD_PICTURES_TO_FIRESTORE:
                print(f'Uploading images from HB {i} to Firebase Storage: ', end="")
                storage.child(f'images/image{i_string}_{j_string}.jpeg').put(f'images/image{i}_{j}.jpeg')
                print("finished")

            # store picture token to get access via url
            if SAVE_LINK_FROM_EACH_FIRESTORE_PICTURE:
                links.append(storage.child(f'images/image{i_string}_{j_string}.jpeg').get_url('idToken'))

            # save pictures locally
            if STORE_PICTURES_LOCALLY:
                file = open(f'images/image{i_string}_{j_string}.jpeg', "wb")
                file.write(image.content)
                file.close()

        imageLink_array.append(links)

    if GENERATE_SINGLE_LABEL_CSV:
        print('\nCreating single-labels: ', end="")
        create_lables(imageHash_array, data_array, False)
        print('finished')

    if GENERATE_MULTI_LABEL_CSV:
        print('\nCreating multi-labels: ', end="")
        create_lables(imageHash_array, data_array, True)
        print('finished')

    if GENERATE_FIRESTORE_DATA_JSON:
        print('\nStart generating json-string and file: ', end="")
        generate_json_string(data_array, imageLink_array)
        print('finished')

    print('\nWhole process is finished!')
