This is a complete avatar package that you can use for your profile and avatar

**Web is Support** 

## Features

**Features:**  
✔️ Initial Text: Displaying initial text for avatars or placeholders.  
✔️ Random Colors: Generating random colors for various elements.  
✔️ Random Linear Gradient: Generating random linear gradient colors.
✔️ Avatar Profile: Creating avatars for profiles or user representation.
✔️ Border Avatar: create a border around the avatar .
✔️ gradient Width Border: Create a gradient color for the borders .
✔️ Use ImageAssets .
✔️ Use ImageNetwork .

![Capture6](https://github.com/SwanFlutter/avatar_better_pro/assets/151648897/ab0394e0-8cb4-4093-861f-c4a8563aff59)

![Capture3](https://github.com/SwanFlutter/avatar_better_pro/assets/151648897/5b229562-fb6d-40fc-a3aa-0655284c3968)




## Getting started

```yaml
dependencies:
  avatar_better_pro: ^0.0.4
```

## How to use

```dart
import 'package:avatar_better_pro/avatar_better_pro.dart';

```

## How to install

### Android

- To request permissions from the user, you can use the following code: AndroidManifest.xml.

```
<uses-permission android:name="android.permission.CAMERA" />
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />

```


### iOS

```xml
    <key>NSPhotoLibraryUsageDescription</key>
    <string>We need access to your photo library to select images for editing.</string>
    <key>NSCameraUsageDescription</key>
    <string>We need access to your camera to take photos for editing.</string>
```


#### macOS installation

Since the macOS implementation uses `file_selector`, you will need to
add a filesystem access
[entitlement](https://docs.flutter.dev/platform-integration/macos/building#entitlements-and-the-app-sandbox):
```xml
  <key>com.apple.security.files.user-selected.read-only</key>
  <true/>
```

## example

```dart
 Avatar.circle(
onTapAvatar: () {},
radius: 35,
text: avatar[index],
randomGradient: true,
randomColor: false,
),,
```

```dart
 Avatar.profile(
              onPickerChange: (file) {
                setState(() {
                  image = file;
                  //  print("image: ${file.path}");
                });
              },
              onPickerChangeWeb: (file) {
                setState(() {
                  imageByte = file;
                });
              },
              radius: 70,
              text: 'Michael',
              randomGradient: true,
              randomColor: false,
            ),
                          
```



## Additional information

If you have any issues, questions, or suggestions related to this package, please feel free to contact us at [swan.dev1993@gmail.com](mailto:swan.dev1993@gmail.com). We welcome your feedback and will do our best to address any problems or provide assistance.
For more information about this package, you can also visit our [GitHub repository](https://github.com/SwanFlutter/avatar_better_pro) where you can find additional resources, contribute to the package's development, and file issues or bug reports. We appreciate your contributions and feedback, and we aim to make this package as useful as possible for our users.
Thank you for using our package, and we look forward to hearing from you!
