# Flutter App Template

Supply a template to generate a typical Flutter app

## Example App using the MVC Design Pattern.

### IMPORTANT FOR ANDROID DEVELOPERS - BEFORE YOU CONTINUE!
This is a large template and the number of method references in a .dex file will exceed 64K.
More info.: https://developer.android.com/tools/building/multidex.html
Modify the following gradle file to enable multidex compilation:

android/app/build.gradle

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId "com.{YOUR DOMAIN}.{YOUR APP}"
        minSdkVersion 19                 <---------- change from 16.
        targetSdkVersion 30
        versionCode flutterVersionCode.toInteger()
        versionName flutterVersionName
        multiDexEnabled true             <---------- insert here.
    }

#### Follow this link to read this documentation online instead: https://medium.com/p/dcaca1629e34/

### Introduction
As you know, the command, 'flutter create .', will create the de facto
'counter app' as the starter app every time you begin a new Flutter project.
It's not a very complicated app; you may even say, it's not a very helpful one either.
An 'app template' supplied by the Flutter SDK is used to create this humble little app.
It's possible, however, to switch out that template and replace it with a better one.
Here, we'll do just that and introduce a more elaborate template that will deliver a more
comprehensive and likely more helpful starter Flutter app for you. In fact, it'll produce
a starter app made up of three separate apps and will implement a number of standard
functions and features you would likely find in more production-worthy Flutter apps.
Below, are two screenshots. The one on the left, you'll recognize as the original 'counter app'
while the one on the right you can see is a little more worthy of a typical Flutter app.

![createTemplate](https://user-images.githubusercontent.com/32497443/142477321-b3d55019-381c-4e7c-80e0-ac4b3e903f47.jpg)

## How it works
The template that creates that new starter app comes from this package, app_template. When you install this package, you'll find it under the folder, pub.dartlang.org, on your machine. It is from there where you can copy the folder called, app, and the file called, template_manifest.json, to the 'templates' folder in your own Flutter SDK.

![pubdartlangorg](https://user-images.githubusercontent.com/32497443/142478002-c7f15d1c-d28e-4565-a496-09eadf3cfc15.jpg)

Go to that package's ' templates' folder to retrieve the more elaborate template. The accompanying template_manifest.json file is necessary to list and install the template's contents. They're highlighted below.

![templates](https://user-images.githubusercontent.com/32497443/142479385-bd5ac99d-49ed-4ca7-826a-1bce690ac51d.jpg)

In the screenshot below of my own Flutter SDK's location, you can see I've backed up the original template files and simply copied over the items highlighted. Go to your own Flutter's SDK location, and find the 'app' template through the directories: packages>flutter_tools>templates.

![myTemplates](https://user-images.githubusercontent.com/32497443/142480050-72659ed0-f6d4-4a94-8dfe-897b6c08d666.jpg)

Copy over those items and with that, the next time you issue the command, 'flutter create.',
you'll get a more comprehensive starter app. Again, I would suggest you first backup the original template files, and be aware this better template is always overwritten with every  Flutter upgrade. I know, such 'user templates' would be a great idea to help you make future projects, and upgrading Flutter should allow for this, however, just such a suggestion was made to the Flutter team some three years ago now with little progress:
[Support user-supplied project templates for flutter create.](https://github.com/flutter/flutter/issues/15279)