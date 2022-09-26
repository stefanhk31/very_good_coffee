# Very Good Coffee

A simple Flutter app that fetches coffee images from an API and allows the user to save their favorite images to their device. Architecture inspired by the [Flutter I/O Photobooth](https://github.com/flutter/photobooth).

*Built by Stefan Hodges-Kluck*

---

## Getting Started 🚀

To run the desired project either use the launch configuration in VSCode/Android Studio or use the following command with an emulator running or device connected:

```sh
$ flutter run
```

---

## Running Tests 🧪

To run all unit and widget tests use the following command:

```sh
$ flutter test --coverage --test-randomize-ordering-seed random
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
$ genhtml coverage/lcov.info -o coverage/
# Open Coverage Report
$ open coverage/index.html
```

---
## Future Directions

This is the MVP version of this app. Features are limited to saving and loading images, one at a time. Several improvements can be made to this app. Some possible additional features include:

- Additional metadata with coffee images (style of coffee, price, etc.)
- User login to allow users to save and rate their favorites
- Social media integration to allow users to share their favorite coffee