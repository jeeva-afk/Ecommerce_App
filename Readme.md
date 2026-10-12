# FixMate – A Home Service App

FixMate is an iOS-based home service booking application developed using **Swift, UIKit, and Xcode**. It provides a convenient platform for users to discover, compare, and book home service professionals such as cleaners, plumbers, electricians, and carpenters.

The application offers user authentication, service search, employee profiles, favorites, booking management, payment validation, notifications, and profile management through a user-friendly interface.

## Features

### Authentication
- User registration and login.
- Input validation and password confirmation.
- Secure password field display using `isSecureTextEntry`.
- Local user data storage using `UserDefaults`.

### Home and Service Discovery
- Browse home service categories.
- View available service providers.
- Search and filter employees by name or service category.
- Display employee information, pricing, ratings, and reviews.
- Interactive service listings using `UICollectionView`.

### Employee Details
- View detailed employee profiles.
- Check service pricing, ratings, and reviews.
- Add or remove employees from favorites.
- Navigate to the booking screen.

### Booking Management
- Select service dates and time slots.
- Enter contact details and service addresses.
- Validate booking form inputs.
- View ongoing and completed bookings.
- Complete, cancel, or delete bookings where supported.

### Payment
- Enter cardholder name, card number, expiry date, and CVV.
- Validate payment form inputs.
- Check card number format using the Luhn algorithm.
- Display payment confirmation after successful validation.

**Note:** Card validation and a success screen do not, by themselves, constitute real payment processing. A payment gateway integration is required for actual transactions.

### Favorites
- Save preferred service providers.
- View saved employees in a dedicated favorites screen.
- Remove employees from favorites.
- Persist favorite data using Core Data.

### Profile Management
- View and edit profile information.
- Update the profile picture using the photo library.
- Access favorites, bookings, notifications, blogs, and logout options.

### Notifications
- Store and retrieve notification records using Core Data.
- Display notifications in a structured table view.

## Technology Stack

| Technology | Purpose |
|---|---|
| Swift | Primary programming language |
| UIKit | Building the iOS user interface |
| Xcode | iOS development and testing |
| Storyboards | Screen design and navigation |
| Auto Layout | Responsive interface layouts |
| UICollectionView | Service categories and employee listings |
| UITableView | Favorites, bookings, and notifications |
| UISearchBar | Service search and filtering |
| UserDefaults | Lightweight local user and profile data storage |
| Core Data | Persistent storage for favorites, bookings, and notifications |
| UIAlertController | Alerts and confirmation messages |
| Git and GitHub | Version control and source code management |
| Alamofire | Planned networking enhancement for API integration |

## Application Architecture

FixMate follows the **MVC (Model–View–Controller)** architecture to separate data, user interface, and application logic.

### Model
Manages application data and persistence.

Examples:
- `Employee`
- `Review`
- `BookingEntity`
- `EmployeeEntity`
- `NotificationEntity`
- `CoreDataManager`

### View
Displays information and captures user interactions using UIKit components.

Examples:
- `UILabel`
- `UIButton`
- `UIImageView`
- `UITextField`
- `UICollectionView`
- `UITableView`
- `UISearchBar`

### Controller
Coordinates the Model and View, handles user actions, validates inputs, and manages screen navigation.

Key controllers include:
- `SignupViewController`
- `HomeViewController`
- `EmployeeDetailsViewController`
- `BookingViewController`
- `BookingDetailsViewController`
- `PaymentViewController`
- `FavoritesViewController`
- `ProfileViewController`

## Data Storage

FixMate uses local persistence to retain selected application data between sessions.

- **UserDefaults:** Stores lightweight user and profile preferences.
- **Core Data:** Manages persistent records such as favorite employees, bookings, and notifications.

The application currently focuses on local data management. Backend services and online synchronization can be introduced as future enhancements.

## Getting Started

### Prerequisites

- A Mac running a compatible version of macOS.
- Xcode.
- An iOS Simulator or compatible iPhone.
- Basic knowledge of Swift and UIKit.

### Installation

1. Clone the repository:

   ```bash
   git clone <YOUR_GITHUB_REPOSITORY_URL>
   ```

2. Navigate to the project directory:

   ```bash
   cd <YOUR_PROJECT_FOLDER>
   ```

3. Open the Xcode project (`.xcodeproj`) or workspace (`.xcworkspace`), depending on the project setup.

4. Select an available iOS Simulator or connected device in Xcode.

5. Configure the appropriate signing settings if running on a physical device.

6. Build and run the application using **Product → Run** or `Command + R`.

## Project Workflow

1. Register a new account or log in.
2. Browse service categories on the home screen.
3. Search for a service provider and view their details.
4. Save preferred providers to favorites.
5. Select a provider and enter the booking details.
6. Proceed to the payment screen and complete the available validation flow.
7. View and manage bookings, favorites, notifications, and profile information.

## Future Enhancements

- Backend API integration for authentication and service data.
- Online database and cloud synchronization.
- Integration with a secure payment gateway.
- Real-time booking status updates.
- Push notifications for booking confirmations and reminders.
- Improved automated testing and error handling.

## Version Control

Git and GitHub are used to track source code changes and manage development branches.

Recommended workflow:

1. Create a feature branch.
2. Implement and test the changes.
3. Commit and push the feature branch.
4. Create a pull request to merge the changes into `main`.

## Conclusion

FixMate aims to simplify home service booking by bringing service discovery, provider comparison, favorites, booking management, and profile features together in one iOS application. Built with Swift and UIKit and organized using MVC, the project provides a foundation for future improvements, including backend integration and online payment processing.

## License

No license has been specified for this project yet. Add a suitable license before distributing or permitting reuse of the source code.
