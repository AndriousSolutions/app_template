# {{projectName}}

{{description}}

## Example App using the MVC Design Pattern.

### IMPORTANT FOR ANDROID DEVELOPERS - BEFORE YOU CONTINUE!
minSdkVersion 16 cannot be smaller than version 19 for the library com.google.firebase:firebase-firestore
As well as allow for multidex compilation.
Modify the following gradle file:

android/app/build.gradle

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId "com.{YOUR DOMAIN}.{YOUR APP}"
        minSdkVersion 19                <---------- at least 19.
        targetSdkVersion 30
        versionCode flutterVersionCode.toInteger()
        versionName flutterVersionName
        multiDexEnabled true            <---------- insert here.
    }

### Introduction


## How it works
