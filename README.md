# {{projectName}}

{{description}}

## Example App using the MVC Design Pattern.

### IMPORTANT FOR ANDROID DEVELOPERS - BEFORE YOU CONTINUE!
This is a large template and the number of method references in a .dex file will exceed 64K.
More info.: https://developer.android.com/tools/building/multidex.html
Modify the following gradle file to enable multidex compilation:

android/app/build.gradle

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId "com.{YOUR DOMAIN}.{YOUR APP}"
        minSdkVersion 16
        targetSdkVersion 30
        versionCode flutterVersionCode.toInteger()
        versionName flutterVersionName
        multiDexEnabled true             <---------- insert here.
    }

### Introduction


## How it works
