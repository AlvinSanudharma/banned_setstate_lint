<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

# 🔒 Banned setState lint

Custom Linter untuk **melarang penggunaan `setState()`** pada proyek Flutter.

## 🚨 Tujuan

Penggunaan `setState()` dalam proyek Flutter berskala menengah hingga besar dapat menyebabkan:

- Rebuild tidak efisien
- Campuran logic dan UI
- Sulit di-maintain dan di-test
- Tidak scalable

Linter ini membantu tim developer untuk **konsisten menggunakan state management yang lebih baik** seperti Bloc, Riverpod, Provider, dsb., dengan **mencegah penggunaan `setState()`** secara otomatis saat proses analisis kode.

## 🛠 Cara Pakai

### 1. Tambahkan ke proyek lint kamu

Silahkan tuliskan kode seperti dibawah ini pada bagian `dev_dependencies` file `pubspec.yaml`
di project anda

```dart
banned_setstate_lint:
    git:
      url: https://github.com/AlvinSanudharma/banned_setstate_lint.git
```

### 2. Edit file `analysis_options.yaml`

Silahkan tambahkan kode seperti dibawah ini pada bagian `analyzer:` file `analysis_options.yaml`
di project anda

```dart
plugins:
    - custom_lint
```

Lalu tambahkan kode seperti dibawah ini (sejajar dengan bagian`linter`)
di project anda

```dart
custom_lint:
  rules:
    - banned_setstate_lint: true
```
