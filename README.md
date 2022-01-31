# Kokos Json Transformer for Dart

Library for json conversion from kokos format to ken format.

## Features

Simply, convert a Json document produced by Kokos framework into a Json document ready
for component visualization in Ken mobile framework. This Dart library is intended for internal
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

