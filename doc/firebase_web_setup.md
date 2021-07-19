# Firebase Web Setup

## 1. Install the firebase cli

In order for firebase functions such as firebase auth to work the firebase emulator needs to be run locally. To do this install the firebase cli and its tools.

```sh
npm install -g firebase-tools firebase-admin firebase-functions
```

## 2. Download private key file for the service account

- Login to the firebase console.
- In the Firebase console, open Settings > Service Accounts.
- Click Generate New Private Key, then confirm by clicking Generate Key.
- Securely store the JSON file containing the key.

## 3. Set environment variable

Set the environment variable GOOGLE_APPLICATION_CREDENTIALS to the file path of the JSON file that contains your service account key. This variable only applies to your current shell session, so if you open a new session, set the variable again.

```sh
export GOOGLE_APPLICATION_CREDENTIALS="/path/to/service-account-file.json"
```

## 4. Run the firebase emulator

Run the following command from the root of the project directory

```sh
firebase emulators:start
```

The output will display urls for each variant of the app. The local internal variant will be <http://localhost:5000>

The emulator serves the built web files file stored in the direcory build/web. To apply new changes, either hot restart or run `flutter build web`
