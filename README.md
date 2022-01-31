
<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

Library for json conversion from kokos format to ken format.

## Features

Simply, convert a Json document produced by Kokos framework into a Json document ready
for component visualization in Ken mobile framework. This library is intended for internal
use in kokos-ken based environments.

## Getting started

No prerequisite needed.

## Usage

Example of use: convert an EXD json type produced by Kokos in a EXD json type
ready for Ken.

```dart
Map kokosJson = <some kokos produced json>;
var kokosJsonTransformer = KokosJsonTransformer();
JsonType type =
        kokosJsonTransformer.getJsonType('EXD');
Map convertedJson = KokosJsonTransformer().transform(type, kokosJson);
```

Kokos json format types managed are:

- EXD
- EXB
- TRE
- FBK


## Additional information
