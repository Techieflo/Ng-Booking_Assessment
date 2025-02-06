# Assessment - Flutter Mobile Application

## Table of Contents
- [Overview](#overview)
- [Setup Instructions](#setup-instructions)
- [Running the App](#running-the-app)
- [Project Approach](#project-approach)
- [API Documentation](#api-documentation)
- [Figma Design](#figma-design)
- [Contributing](#contributing)
- [License](#license)

---

## Overview
This Flutter mobile application was developed as part of an assessment to showcase mobile development skills. The application includes essential authentication features such as user registration, login, and dashboard navigation. The app interacts with a provided backend API to handle authentication and fetch necessary data. The UI follows the provided Figma design to ensure consistency and usability.

---

## Setup Instructions
### Prerequisites
Before running the application, ensure you have the following installed:
- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- [Dart](https://dart.dev/get-dart)
- Android Studio or Visual Studio Code with Flutter extension
- An emulator or a physical device configured for debugging

### Installation Steps
1. **Clone the Repository**
   ```sh
   git clone https://github.com/Techieflo/Ng-Booking_Assessment
   cd assessment
   ```

2. **Install Dependencies**
   ```sh
   flutter pub get
   ```

3. **Set Up API Configuration**
   The application interacts with a backend service hosted at `https://mobile-assessment.onrender.com/api`. To ensure seamless API interaction, the base URL is stored as a constant in the .env file:
   ```dart
   const String baseUrl = "https://mobile-assessment.onrender.com/api";
   ```

---

## Running the App
### On an Emulator or Physical Device
1. Connect your device via USB or start an emulator.
2. Run the following command:
   ```sh
   flutter run
   ```
3. For iOS, ensure you have CocoaPods installed and run:
   ```sh
   cd ios && pod install && cd ..
   flutter run
   ```

---

## Project Approach
To complete this project, I used the following technologies and methodologies:
- **State Management:** Implemented GetX for efficient state management and navigation, ensuring smooth data handling and page transitions.
- **Authentication:** Used the provided API endpoints for user authentication (signup and login). Managed token storage using `SharedPreferences`.
- **Navigation:** Implemented GetX for route management, making navigation efficient and seamless.
- **UI Implementation:** Followed the Figma design to create visually appealing and user-friendly interfaces.
- **API Consumption:** Utilized the `Dio` package for efficient API calls and error handling.
- **Form Validation:** Implemented real-time validation for user input to improve UX and prevent incorrect data submission.
- **Error Handling:** Displayed proper error messages using Snackbars and alerts to improve user experience.
- **Security Considerations:** Ensured API keys and sensitive data are not exposed in the codebase.

---

## API Documentation
The application interacts with the backend API to manage user authentication and fetch data.
- **Base URL:** [https://mobile-assessment.onrender.com/api](https://mobile-assessment.onrender.com/api)
- **API Endpoints Documentation:** [API Docs](https://mobile-assessment.onrender.com/api-docs)

---

## Figma Design
The application's UI was designed based on the Figma design provided in the assessment. The design was closely followed to maintain consistency in layout and user experience.

[Click here to access the Figma design](#) *(https://www.figma.com/design/QOi8B1WzFLdr8eANLxfqSv/Test-project?node-id=0-1&t=JAD4XM1ZkylziCMg-1)*

---

## Contributing
For any contributions, follow these steps:
1. Fork the repository.
2. Create a new branch: `git checkout -b feature-branch`.
3. Implement your changes and commit: `git commit -m 'Added new feature'`.
4. Push to the branch: `git push origin feature-branch`.
5. Submit a pull request.

---

## License
This project is licensed under the MIT License.

