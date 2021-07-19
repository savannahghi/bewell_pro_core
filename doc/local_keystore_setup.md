# Local Keystore Setup

## Android

### 1. Download the keystore

This step assumes that you have installed `gcloud` SDK and you have setup `bewell-app` as your project.

The debug keystore file is stored in a Gcloud bucket named `android-keys-box`

To download the file, run

```sh
gsutil cp gs://android-keys-box/debug_sil.keystore $HOME/.android
```

### 2. Create properties file

Open the project in your editor. Create a file called debug_key.properties in the android folder. Place the following within the file:

```txt
storePassword=android
keyPassword=android
keyAlias=androiddebugkey
storeFile=/home/$USER/.android/debug_sil.keystore
```

Save the file and run the project.

Change the storeFile path to the one below incase you are using a Mac

```
storeFile=/Users/$USER/.android/debug.keystore
```
