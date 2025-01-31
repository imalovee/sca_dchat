# sca_dchat_app

This is a chatapp built with flutter.
This app authenticates users with firebase Auth, and also store's user data with firestre.
Upon Login, current user and view all the other registered and available users in the Home screen.
In the inbox_screen, Chats between users are saved/stored to firebase and also fetched back in realtime using stream builder.
Also, last mesages/chats between users are fetched back to the home screen alongsde the time of last messages.
The state of the app is managed with the provider package.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
