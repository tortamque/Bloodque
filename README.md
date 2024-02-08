<a href="https://flutter.dev/"><img src="https://cdn.icon-icons.com/icons2/2107/PNG/512/file_type_flutter_icon_130599.png" align="right" width="10%"></a>

# Bloodque
## Description
Bloodque is an essential tool designed to help users monitor and track their pulse measurements efficiently. </br>
Bloodque is crafted with the user at the forefront, incorporating a [Clean architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) pattern that seamlessly merges [Repository](https://developer.android.com/codelabs/basic-android-kotlin-training-repository-pattern#3) and [Bloc](https://bloclibrary.dev/#/flutterbloccoreconcepts) patterns.

## Table of Contents
- [Architecture](#architecture)
- [Features](#features)
- [Supported platforms](#supported-platforms)
- [Installation](#installation)
- [Usage](#usage)
- [Screenshots and Demo](#screenshots-and-demo)
- [Changelog](#changelog)
- [Used Packages](#used-packages)
- [License](#license)

<a name="architecture"/></a>
## Architecture
Bloodque fully embraces the Clean Architecture pattern, incorporating both the Bloc and Repository patterns.</br>
Clean Architecture consists of the following layers: 
1) Data Layer
2) Domain Layer (Business Logic)
3) Presentation Layer (UI) </br></br>

Architecture for <b>Storage calls</b>:
![Hive](https://github.com/tortamque/Bloodque/assets/90132962/8afa8e70-d09f-4c2f-9a64-6761cfddbc47)

<a name="features"/></a>
## Features
- Record user's pulse measurements, including Systolic and Diastolic blood pressure readings.
- Select date and time for each pulse measurement, allowing for precise tracking.
- View a comprehensive history of user's pulse measurements.
- Store pulse measurements securely in a database for future reference.

<a name="supported-platforms"/></a>
## Supported platforms
Bloodque is a cross-platform mobile application that supports both <b>Android</b> and <b>iOS</b> platforms.

<a name="installation"/></a>
## Installation
To run the Bloodque app locally, follow these steps:

1. Clone this repository to your local machine.
2. Ensure you have Flutter and Dart installed on your system.
3. Navigate to the project directory in your terminal.
4. Run the command `flutter pub get` to install the required dependencies.
5. Connect a device or start an emulator.
6. Run the command `flutter run` to launch the app.

<a name="usage"/></a>
## Usage
1. Launch the Bloodque app on your device or emulator.
2. The main menu will display your last three measurements.
3. To add a new record:
   - Tap the "Add" button.
   - Select Systolic, Diastolic, and Pulse measurements.
   - Choose the date and time of the measurement.
   - Tap the "Save" button.
4. Press the "All History" button to view all your measurements.

<a name="screenshots-and-demo"/></a>
## Screenshots and Demo
### Screenshots
<img src="https://github.com/tortamque/Bloodque/assets/90132962/7b6ad02a-1b72-437d-b4de-ae20ab05acdc" alt="Screenshot_1" width="200">
<img src="https://github.com/tortamque/Bloodque/assets/90132962/990cd57a-1ce9-4f1f-99d9-2722987669a4" alt="Screenshot_2" width="200">
<img src="https://github.com/tortamque/Bloodque/assets/90132962/c618d533-63e8-4d01-abc1-1a12bde1ab47" alt="Screenshot_3" width="200">
<img src="https://github.com/tortamque/Bloodque/assets/90132962/460cd6a3-4959-4506-a461-ae810dec6529" alt="Screenshot_4" width="200">
<img src="https://github.com/tortamque/Bloodque/assets/90132962/50f36b4d-ff56-4d1c-8912-24e58a83ae21" alt="Screenshot_5" width="200">

### Demo
https://github.com/tortamque/Bloodque/assets/90132962/5ee206fb-54d8-4e19-9137-1065a4f4efcc

<a name="changelog"/></a>
## Changelog
 ### [1.0] - 08.02.2024
  #### Added
 - Initial release. 🔮

<a name="used-packages"/></a>
## Used Packages
The Bloodque app utilizes the following packages:

| Name          | Version | Link on pub.dev                                       |
|---------------|---------|-------------------------------------------------------|
| flutter_bloc  | 8.1.3   | [Link](https://pub.dev/packages/flutter_bloc)         |
| get_it        | 7.6.7   | [Link](https://pub.dev/packages/get_it)               |
| numberpicker  | 2.1.2   | [Link](https://pub.dev/packages/numberpicker)         |
| intl          | 0.19.0  | [Link](https://pub.dev/packages/intl)                 |
| hive          | 2.2.3   | [Link](https://pub.dev/packages/hive)                 |
| hive_flutter  | 1.1.0   | [Link](https://pub.dev/packages/hive_flutter)         |
| equatable     | 2.0.5   | [Link](https://pub.dev/packages/equatable)            |
| fluttertoast  | 8.2.4   | [Link](https://pub.dev/packages/fluttertoast)         |


<a name="licenses"/></a>
## License
Apache License Version 2.0
