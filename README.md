# posts

## Getting Started

Change app pakcage name

flutter pub run change_app_package_name:main com.package.name

Change app name

flutter pub run rename_app:main all="My App Name"

Change app icon

1. Uncomment in yaml:

# flutter_icons:

# android: "launcher_icon"

# ios: true

# image_path: "assets/images/logo.png

2. flutter pub run flutter_launcher_icons:main
3. comment them again as they will block images from rendering
