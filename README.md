# Billeddeling

## A full-stack image sharing and cloud storage using Flutter, Firebase and GetX. With Facebook and Google Signin/ Signup facilities.

A full-stack image sharing and cloud storage using Flutter, Firebase and GetX. With Facebook and Google Signin/ Signup facilities. Users can signin or signup using their preferred platform and share/ upload image posts directly from their gallery or storage, and back them up on the cloud.

* User Authentication using Firebase Authentication, Google Auth and Facebook Auth.
* Backend using Firebase Cloud Firestore
* State management using GetX
* Image compressor, Image cropping and choosing is achieved using my package from pub.dev: [SelectCropCompressImage](https://pub.dev/packages/selectcropcompressimage)

## Demo video and in-app screenshots

* [IUBRSA Demo Video - TO be uploaded](https://sites.google.com/view/workwithafridi)

![Demo Image - TO be uploaded](https://sites.google.com/view/workwithafridi)

## How to install the app on your physical device

Download the source code and compile the apk using Flutter CLI or Android Studio

## Want to contribute to the project? 

Just send in your pull req. I'll for sure have a look into it. :)

## APKs

APKs can be found [here] (https://drive.google.com/drive/folders/1uJOkFjLKxMm0jRECrq9ruT29ZszCIt4z?usp=sharing)

## Firebase Firestore Architecture Structure

- users -> List of users with their properties.
- posts -> List of image posts with their properties.

## Models include

- UserModel: email, name, profilePicUrl, userId and a list of the users postId.
- PostModel: postId, imageId, date, title, url, userId

