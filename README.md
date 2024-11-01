# Users parsing app

This is an app that fetches data from a JSON API and displays a list of users. The app uses SwiftData for data management and SwiftUI for the user interface.

- `ContentView`: This is the main view of the app. It displays a list of users fetched from the JSON API. Users can be sorted by age and name using the `@Query` property wrapper. The view also includes a `fetchData()` function that fetches data from the JSON API using `URLSession` and decodes it into an array of User objects using JSONDecoder. Users who are active are marked with brighter color than inactive users.
- `DetailView`: This view displays detailed information about a selected user. It takes a User object as input and displays its properties such as name, age, company, email, address, about, registered, tags, and friends. Also it is a special mark which shows a status of a user.
- `User`: This class represents a user with properties such as id, isActive, name, age, company, email, address, about, registered, tags, and friends. The class conforms to the Codable protocol.
- `Friend`: This class represents a friend of a user with properties such as id and name. The class also conforms to the Codable protocol.

The app fetches data from a JSON API using URLSession and decodes it into an array of User objects using JSONDecoder. The User objects are then displayed in a list view in ContentView.swift. When a user is selected, the app navigates to the DetailView and displays detailed information about the selected user.
