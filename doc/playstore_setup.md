# Keystore generation

To publish to playstore, the app needs to to signed using a keystore. Hence, one has to generated with the command below;

WARNING;
The keystore can only be generated once. The below is just for documentation purposes and should not be repeated.

```sh
keytool -genkey -v -keystore $PWD/bewellapp_keystore.jks -keypass Q19j@sbl7%dn -keyalg RSA -keysize 2048 -validity 10000 \
-alias bewellapp_keystore_alias -storepass Q19j@sbl7%dn -dname 'CN=SavannahInformatics ,O=BeWell,C=Ke'
```

# Key management

We use google cloud key management service to store our keystore in a safe and reliable place.

To see our keyrings run

```sh
gcloud kms keyrings list --location europe-west3
```

Currently we only have one keyrings, **android-keys**. The keyring has also one key , **android-crypto-key**

The file was encrypted by running the command

```sh
gcloud kms encrypt --location europe-west3 --keyring android-keys --key android-crypto-key \
  --plaintext-file $PWD/bewellapp_keystore.jks --ciphertext-file $PWD/bewellapp_keystore.jks.encrypted
```

The encrypted keystore is stored in our cloud storage bucket called **android-keys-box**

To download it locally to your machine (ILL-ADVISED), run

```sh
gsutil cp gs://android-keys-box/<file-name> .
```

The keystore can be decrypted by running

```sh
gcloud kms decrypt --location europe-west3 --keyring android-key --key android-crypto-key
  --ciphertext-file bewellapp_keystore.jks.encrypted --plaintext-file bewellapp_keystore.jks.decrypted
```

Typically, the above will be run from CI/CD setup, so a local developer should not be super bothered unless when
circumstances really require.
