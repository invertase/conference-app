# Flutter Conference Toolkit

The Conference app toolkit is an app template that can be used to create a Flutter conference app for your event easily.

## Getting started

The toolkit uses Mason to help you generate the app following a template. To get started, install Mason:

```bash
dart pub global activate mason_cli
```

Additionally, you need the FlutterFire CLI to initialize Firebase for your app:

```bash
dart pub global activate flutterfire_cli
```

Then, create a new directory:

```bash
mkdir my_conference_app
cd my_conference_app
```

Then, run the following command to add the template:

```bash
mason init
mason add conference_app_toolkit --path ../conference_app_toolkit
```

Finally, run the following command to generate the app:

```bash
mason make conference_app_toolkit
```

## Troubleshooting

If you get an error regarding incompatible versions of `Firebase/Firestore` when running the app on iOS:

```bash
    [!] CocoaPods could not find compatible versions for pod "Firebase/Firestore":
      In snapshot (Podfile.lock):
        Firebase/Firestore (= 10.10.0)

      In Podfile:
        cloud_firestore (from `.symlinks/plugins/cloud_firestore/ios`) was resolved to 4.8.4, which depends on
          Firebase/Firestore (= 10.12.0)
```

You can fix it by running:

```bash
cd ios
pod install --repo-update
```