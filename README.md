# FlexiCharge-Cross-Platform
A app written in Flutter for Flexicharge by third year students from Jönköping University (2021)

## Setup
Make sure flutter is installed on you system. Check for errors by running `flutter doctor` in a terminal. If Flutter is not installed, follow your respective operating system install guide in the file README_FLUTTER_SETUP.md

Download the project by either cloning it or by downloading the zip-file. After extracting the project, open it up with Visual Studio Code.

### VSCode
Make sure that the extention Flutter (version: v3.27.0) is installed and enabled.

If you get prompted that some packages are missing, press download. Else, go to pubspec.yaml and and download the packages from there, or download from the terminal by entering `flutter pub get`

The app can now be started with either the command `flutter run` or by going to main.dart. If you have a connected supported Android or IOS device,  or an emulator up and running, the app should launch fine. :)

### Versions
Developed with Flutter version 

- 2.2.1

Supports Android versions

- minSdkVersion 26
- targetSdkVersion 30

Supports IOS versions
- Non set

## Architecture
### Stacked Architecture
TODO
https://www.filledstacks.com/post/flutter-and-provider-architecture-using-stacked/

### Naming convention
- Files: snake_case
- Classes: PascalCase
- General variables: camelCase
- Private member variables: _camelCase

### Services
Used mostly when accessing the API and making requests
https://www.filledstacks.com/post/services-in-code-and-how-to-use-them-in-flutter/

### LocalData
A class that enables us to save variables into an object that we can access from anywhere. Unified place to find common variables used on several occasions across the whole app.

### Models
A way to map data to a class. Used to map json-objects from the API into usable data-classes.

# Workflow
Documentation about how certain actions are performed within the app, steps needed and in what order etc.

## Connect to charger
When a valid charger ID has been entered we want to reserve the charger during the payment process.
To enter a charger, we need the charger ID. We can get this from three different ways.
1. Scan QR code on the charger, which automatically enters the charger ID into the PIN input field.
2. Choose a charger point (green marker on the map view) and select a charger from the list. This will also automatically enter the pin into the PIN input field
3. Enter the Charger ID manually.

Then, we create a transaction session and receive a transaction object back from the API.
This transaction object contains a transactionID that we need when getting a authentication token from Klarna.
The authentication token from Klarna can then be used to update our transaction object that verifies that our transaction was successful.

In snappingsheet_viewmodel.dart, the connect function solves this.

## Klarna Payment
There exists no native implementation of Klarna within Flutter, therefore it is implemented in native Android and IOS. 

# Contribution
Follow the convention and coding style explained under chapter Architecture.
