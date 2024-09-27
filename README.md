## Instalar bibliotecas pelo terminal

`dart pub add firebase_core:3.5.0`

`dart pub add --dev firebase_core:3.5.0`


### Firebase Hosting

`firebase init`

Selectione hosting e o projeto atual.
Defina a pasta de publicação (public) para `build/web`

`flutter build web --release`

`firebase deploy`

### Firebase App Distribution

https://firebase.google.com/docs/app-distribution/android/distribute-cli?hl=pt-br


```
firebase appdistribution:distribute build\app\outputs\flutter-apk\app-release.apk --app 1:965365924771:android:483601697bd190a5801016 --release-notes "New version" --testers-file testers.txt
```