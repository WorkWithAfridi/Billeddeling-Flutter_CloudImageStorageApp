# Billeddeling

Welcome to the documentation for Billeddeling - the image sharing app that allows users to store their images in a cloud storage! This app is built using Flutter, getx, and Firebase, providing a seamless and secure experience for all users.

Features:

Built-in image selection from gallery or capture an image from the camera
Cropping and rotating features to edit the selected images
Image and video compressing features to save storage space
Secure cloud storage using Firebase
User authentication and authorization for privacy and security
Getting Started:
To get started with Billeddeling, you can download the app from the Google Play Store or the App Store. Once downloaded, create an account or sign in with your existing Firebase account.

Selecting and Editing Images:
To select an image from the gallery or capture an image from the camera, simply navigate to the "Select Image" screen and choose the appropriate option. Once you have selected an image, you can crop or rotate it using the built-in editing features.

Compressing Images and Videos:
To save storage space on your device, you can compress your images and videos using the "Compress" feature in the app. This will reduce the file size without sacrificing too much image or video quality.

Uploading and Sharing Images:
Once you have edited and compressed your images and videos, you can upload them to the cloud storage using the "Upload" feature. From here, you can also share your images with other users on the app.

Privacy and Security:
Billeddeling uses Firebase for secure cloud storage, as well as user authentication and authorization. This ensures that your images and data are protected and only accessible to authorized users.

Conclusion:
Billeddeling is a powerful and secure image sharing app that allows users to store their images in the cloud and share them with others. With built-in editing and compressing features, this app is perfect for anyone looking to save space and share their images with friends and family.

## Demo video and in-app screenshots

* [Demo Video](https://youtu.be/Mregnso6uLg)

![Demo Image](https://github.com/llKYOTOll/Billeddeling_Tikweb_TechnicalCodingTest_App/blob/master/assets/promotional_image/promotional_img.png?raw=true)

## How to install the app on your physical device

Download the source code and compile the apk using Flutter CLI or Android Studio. Or download the APK from  [here](https://drive.google.com/drive/folders/1uJOkFjLKxMm0jRECrq9ruT29ZszCIt4z?usp=sharing)

## Want to contribute to the project? 

Just send in your pull req. I'll for sure have a look into it. :)

## APKs

APKs can be found: [here](https://drive.google.com/drive/folders/1uJOkFjLKxMm0jRECrq9ruT29ZszCIt4z?usp=sharing)

Debug and Release APK files can also be found in the github apk_files directory.

## Firebase Firestore Architecture Structure

- users -> List of users with their properties.
- posts -> List of image posts with their properties.

## Models include

- UserModel: email, name, profilePicUrl, userId and a list of the users postId.
- PostModel: postId, imageId, date, title, url, userId

