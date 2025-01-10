# Dog Images App

A Flutter app that fetches random dog images and breed lists using the [Dog CEO API](https://dog.ceo/dog-api/). The app uses **BLoC** for state management and **Clean Architecture** for better code organization. It also integrates Firebase to store and retrieve user-favorited dog images.

---

## **Features**

- Fetch random dog images by breed.
- View a list of dog breeds.
- Select breeds from a dropdown.
- Store and retrieve favorite dog images using Firebase.

---

## **Setup Instructions**

### **1. Prerequisites**

- Flutter installed ([Flutter installation guide](https://docs.flutter.dev/get-started/install)).
- Android Studio or Xcode for emulators and device debugging.
- Firebase project setup ([Firebase console](https://console.firebase.google.com/)).
- Dog CEO API endpoint ([API documentation](https://dog.ceo/dog-api/)).

### **2. Clone the Repository**

```bash
git clone https://github.com/your-username/dog-images-app.git
cd dog-images-app
```

### **3. Install Dependencies**

Run the following command to install all the necessary dependencies:

```bash
flutter pub get
```

### **4. Firebase Configuration**

1. Open the Firebase console and add your app (iOS, Android, Web, etc.).
2. Download the `google-services.json` file for Android and place it in the `android/app` directory.
3. Download the `GoogleService-Info.plist` file for iOS and place it in the `ios/Runner` directory.
4. Run the FlutterFire CLI to configure Firebase:

   ```bash
   flutterfire configure
   ```

### **5. Run the App**

To launch the app, use:

```bash
flutter run
```

---

## **Project Structure**

The project follows Clean Architecture principles:

```
lib/
├── blocs/                # BLoC files for state management
├── models/               # Data models (e.g., Dog, Breed)
├── repositories/         # Data handling and API logic
├── services/             # Services for external communication (e.g., API calls)
├── ui/                   # User interface components
│   ├── screens/          # Screens of the app
│   └── widgets/          # Reusable widgets
├── main.dart             # Application entry point
```

---

## **APIs Used**

- **[Dog CEO API](https://dog.ceo/dog-api/):** Provides data about dog breeds and images.
- **Firebase:** Stores and retrieves user-favorited dog images.

---
