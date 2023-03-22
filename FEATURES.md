# Salt Music

# Features

- Salt Music lets you see the top 100 albums in iTunes Music.
- App has clean architecture, state management and maintainable code.
- App has Light Mode and Dark Mode support.
- App has 3 base pages; `Home Page`, `Search Page`, `Albums Page`.
- `Home Page`, has top 100 categorized albums.
- `Search Page`, has the list of top 100 albums and lets you search on it.
- `Albums Page`, has the list of top 100 albums and lets you sort the list by album name and release date.
- `Album Details Page`, lets you see the album image, album name, artist name, release date, song count and album price. By click the album name, you can open the album on browser. By click the artist name, you can open the artist page on browser.

# Tests

- Salt Music app has Unit and Widget tests.
- Test coverage is %87.

### Generate `coverage/lcov.info` file
```bash
flutter test --coverage
```
### Generate HTML report
Note: on macOS you need to have lcov installed on your system (`brew install lcov`) to use this:
```bash
genhtml coverage/lcov.info -o coverage/html
```
### Open the report
```bash
open coverage/html/index.html
```
## Full Command

```bash
flutter test --coverage && genhtml coverage/lcov.info -o coverage/html && open coverage/html/index.html
```


# Architecture

- Salt Music app has a modular architecture with GetX.
- App has 4 base modules; `Home Module`, `Search Module`, `Albums Module`, `Base Module`.

# Theming

- App has 2 themes; `Light Theme`, `Dark Theme`.
- App has `lightTheme`, `darkTheme` theme codes.

# Localization

- App is ready to localization.
- On the `translations.dart` file, app has default English translation keys and values.

# Folder and File Structure

```
├── app
│   ├── common
│   │   ├── constants
│   │   │   ├── api_constants.dart
│   │   │   └── app_constants.dart
│   │   ├── extension
│   │   │   └── widget_extensions.dart
│   │   ├── helper
│   │   │   └── json_converter.dart
│   │   ├── resource
│   │   │   ├── theme.dart
│   │   │   └── translations.dart
│   │   └── widget
│   │       ├── album_detail.dart
│   │       ├── album_list_item.dart
│   │       └── album_square_item.dart
│   ├── data
│   │   ├── model
│   │   │   ├── album.dart
│   │   │   ├── album.g.dart
│   │   │   ├── album_response.dart
│   │   │   ├── album_response.g.dart
│   │   │   ├── artist.dart
│   │   │   ├── artist.g.dart
│   │   │   ├── category.dart
│   │   │   └── category.g.dart
│   │   ├── repository
│   │   │   └── album_repository.dart
│   │   └── service
│   │       ├── interceptors.dart
│   │       ├── rest_client.dart
│   │       └── rest_client.g.dart
│   ├── modules
│   │   ├── albums
│   │   │   ├── bindings
│   │   │   │   └── albums_binding.dart
│   │   │   ├── controllers
│   │   │   │   └── albums_controller.dart
│   │   │   └── views
│   │   │       ├── albums_view.dart
│   │   │       └── widgets
│   │   │           └── sort_modal.dart
│   │   ├── base
│   │   │   ├── bindings
│   │   │   │   └── base_view_binding.dart
│   │   │   ├── controllers
│   │   │   │   └── base_view_controller.dart
│   │   │   └── views
│   │   │       └── base_view.dart
│   │   ├── home
│   │   │   ├── bindings
│   │   │   │   └── home_binding.dart
│   │   │   ├── controllers
│   │   │   │   └── home_controller.dart
│   │   │   └── views
│   │   │       └── home_view.dart
│   │   └── search
│   │       ├── bindings
│   │       │   └── search_binding.dart
│   │       ├── controllers
│   │       │   └── search_controller.dart
│   │       └── views
│   │           └── search_view.dart
│   └── routes
│       ├── app_pages.dart
│       ├── app_routes.dart
│       └── binding.dart
└── main.dart
```
