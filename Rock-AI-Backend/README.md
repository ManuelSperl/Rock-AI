# Backend Documentation
## Data Storage and Preprocessing
Two self-written Python programs are used to fetch the records from the API https://health.api.makia.ml and store them in a custom format in the Firebase Firestore (images are stored in the Firebase Storage).

### [API_Request_generate_JSON.py](https://github.com/ManuelSperl/Rock-AI/tree/main/Rock-AI-Backend/API_Requests)
This file first fetches the records from the above URL as a JSON file and stores the data in local lists and variables. It then stores the corresponding images in a local folder and uploads them to the Firebase storage. In order to store the images in the Firestore database later, the https token of each image is also stored locally. Finally, the script generates a JSON file in a user-defined format for the desired structure in the Firestore database.
It also creates a CSV file that labels all the images for machine learning training. (See in the documentation under step 1 under Setting up an exportable model).
More detailed documentation can be found in the [Python file](https://github.com/ManuelSperl/Rock-AI/blob/main/Rock-AI-Backend/API_Requests/API_Request_generateJSON.py).

### [uploadJSONFileToFirestore.py](https://github.com/ManuelSperl/Rock-AI/blob/main/Rock-AI-Backend/UploadJsonToFirebase/uploadJsonFileToFirestore.py)
With the command: 
`python uploadJsonFileToFirestore.py <json-file-name>.json add <database-name>`
each JSON file (to be specified in `<json-file-name>`), which corresponds to the format for a Firestore upload, is uploaded to the Firestore database under a desired database name (to be specified in `<database-name>`).
It is important that the files `service-account.json` and `google-services.json` come from the corresponding Firebase database and that the access rights are correctly assigned.

These two files enable an automatic upload and adjustment of the API data sets and the Firebase database. Thus, in the future, larger amounts of data sets can be uploaded from the API to the Firestore database without any time expenditure.

Likewise, the structure of the database can be easily adapted through the JSON file in [API_Request_generate_JSON.py](https://github.com/ManuelSperl/Rock-AI/blob/main/Rock-AI-Backend/API_Requests/API_Request_generateJSON.py), in order to quickly fix any problems that arise (whether for the ML or for the app).

## Image Augmentation
### Theory
Image data augmentation is a technique that can be used to artificially expand the size of a training dataset by creating modified versions of images in the dataset.</br>
Training deep learning neural network models on more data can result in more skillful models, and the augmentation techniques can create variations of the images that can improve the ability of the fit models to generalize what they have learned to new images.

### Usage
In our case, at this point we only had around 500 images for the training of our Machine Learning-Model. Therefore, we applied image augmentation to create a larger data set. In the file [image_augmentation.py](https://github.com/ManuelSperl/Rock-AI/blob/main/Rock-AI-Backend/Image_Augmentation/image_augmentation.py) we made a few standard changes to the images such as: horizontal flipping, rotating, contrast change, etc.</br>
This uses the locally stored images from the database and edits them many times depending on the specification.
</br></br>
In the file [References Image Augmentation for Machine Learning.pdf](https://github.com/ManuelSperl/Rock-AI/blob/main/Rock-AI-Backend/Image_Augmentation/References%20Image%20Augmentation%20for%20Machine%20Learning.pdf) you can find more references that might be useful for further work on this project.

## Machine Learning with Google AutoML
For the machine learning process, the machine learning function provided by Firebase was used. An in-depth [documentation](https://github.com/ManuelSperl/Rock-AI/blob/main/Rock-AI-Backend/Dokumentation_Backend_ML.pdf) explains all of the steps that were performed (documentation is written in German). </br>
All of the trained models for local use can be found in the [trainedAutoMLModels](https://github.com/ManuelSperl/Rock-AI/tree/main/Rock-AI-Backend/trainedAutoMLModels) folder. There are four models which were trained to do perform a single-labeling on the pictures with the attribute "GEFÄHRDUNGSKLASSE". Additionally there is one model which was trained to execute a multi-labeling on the picture. 
Further details about the models, e.g. how many pictures were used for the training, can be found in the documentation.
