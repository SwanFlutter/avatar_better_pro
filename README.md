This is a complete avatar package that you can use for your profile and avatar

**Web is Support** 

## Features

**Features:**  
✔️ Initial Text: Displaying initial text for avatars or placeholders.  
✔️ Random Colors: Generating random colors for various elements.  
✔️ Random Linear Gradient: Generating random linear gradient colors.  
✔️ Avatar Profile: Creating avatars for profiles or user representation.  
✔️ Border Avatar: create a border around the avatar.  
✔️ gradient Width Border: Create a gradient color for the borders.  
✔️ Use ImageAssets.  
✔️ Use ImageNetwork.

![avatar6](https://github.com/user-attachments/assets/8e176a21-6ec7-47f1-bdd6-ab417851d7cd)
![avatar5](https://github.com/user-attachments/assets/d226ecba-fd44-4d3f-8f7b-86a8b8bcc94a)
![avatar8](https://github.com/user-attachments/assets/b3f4b33d-1a70-4031-b019-725ff03f31c6)
![avatar9](https://github.com/user-attachments/assets/860bf717-3b65-4f3c-8e88-2ddd5060b420)




![Capture3](https://github.com/SwanFlutter/avatar_better_pro/assets/151648897/5b229562-fb6d-40fc-a3aa-0655284c3968)




## Getting started

```yaml
dependencies:
  avatar_better_pro: ^0.0.9
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

- Add this line code to application AndroidManifest.xml

```xml
android:requestLegacyExternalStorage="true"
```

```xml
<application
        android:label="avaterbetter"
        android:name="${applicationName}"
        android:icon="@mipmap/ic_launcher"
        android:requestLegacyExternalStorage="true">
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
 Avatar(
onTapAvatar: () {},
radius: 35,
text: avatar[index],
randomGradient: true,
randomColor: false,
useMaterialColorForGradient: true,
mixColorForGradient: false,

),,
```

![avatar7](https://github.com/user-attachments/assets/1dd789e9-979b-4f06-ac3c-a469507d9919) <img width="414" height="784" alt="avatar_better" src="https://github.com/user-attachments/assets/ddab13bd-c602-489d-ac7e-4823c94a0e13" />



```dart
 Avatar.profile(
               onPickerChange: (file, bytes) {
                setState(() {
                  image = file;
                  imageBytes = bytes;
                });
              },
              onPickerChangeWeb: (bytes) {
                setState(() {
                  imageByte = file;
                });
              },
              radius: 35,
                  text: avatar[index],
                  randomGradient: true,
                   randomColor: false,
                    useMaterialColorForGradient: true,
                     mixColorForGradient: false,
                      bottomSheetStyles: BottomSheetStyles(
                       galleryButton: GalleryBottom(style: const TextStyle(), color: Colors.amber, text: 'Gallery', icon: const Icon(Icons.image_outlined)),
                    cameraButton: CameraButton(style: const TextStyle(), color: Colors.amber, text: 'Camera', icon: const Icon(Icons.camera_alt_outlined)),
                  backgroundColor: Colors.amberAccent,
               elevation: 2,
            middleText: 'OR',
         middleTextStyle: const TextStyle(),
      ),
  ),
            
                          
```

## Additional information

If you have any issues, questions, or suggestions related to this package, please feel free to contact us at [swan.dev1993@gmail.com](mailto:swan.dev1993@gmail.com). We welcome your feedback and will do our best to address any problems or provide assistance.
For more information about this package, you can also visit our [GitHub repository](https://github.com/SwanFlutter/avatar_better_pro) where you can find additional resources, contribute to the package's development, and file issues or bug reports. We appreciate your contributions and feedback, and we aim to make this package as useful as possible for our users.
Thank you for using our package, and we look forward to hearing from you!
