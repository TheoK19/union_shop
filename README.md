# Union Shop App

A Flutter-based mobile application for the university union shop, providing students with an easy way to browse and purchase university-branded merchandise and other products.

## 🚀 Features

This application is designed to replicate the experience of the physical union shop, with a focus on ease of use and a clean, intuitive interface.

- **Product Discovery:**
    - **Collections Page:** Browse through different categories of products.
    - **Product Detail Page:** View detailed information about each product.
    - **Sale Page:** Find deals and discounted items.
- **User Authentication:**
    - Secure login and sign-up functionality for a personalized experience.
- **Informational Pages:**
    - **About Us:** Learn more about the Students' Union shop.
    - **FAQ:** Get answers to frequently asked questions.
- **Specialized Services:**
    - **Print Shack:** Access printing services directly through the app.
- **Modern UI:**
    - A clean, visually appealing interface.
    - Smooth navigation with a persistent navigation bar and footer.

## Getting Started

Follow these instructions to get a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

- Flutter SDK (version 3.x.x or higher)
- Dart SDK
- A code editor like VS Code or Android Studio with the Flutter plugin.

### Installation & Setup

1.  **Clone the repository:**
    ```sh
    git clone <your-repository-url>
    ```
2.  **Navigate to the project directory:**
    ```sh
    cd union_shop
    ```
3.  **Install dependencies:**
    ```sh
    flutter pub get
    ```
4.  **Run the application:**
    ```sh
    flutter run
    ```
    You can also select your target device in your IDE and run the app from there.

## Project Structure

The project is structured to maintain a clean and scalable architecture.

```
lib/
├── main.dart                 # App entry point
├── models/                   # Data models (e.g., Collection)
├── services/                 # Business logic (e.g., CollectionsService)
├── pages/ or screens/        # UI for different pages
│   ├── auth_page.dart
│   ├── home_page.dart
│   ├── collections_page.dart
│   ├── product_page.dart
│   ├── sale_page.dart
│   ├── about_us_page.dart
│   ├── faq_page.dart
│   └── print_shack_page.dart
├── widgets/ or components/   # Reusable UI components
│   ├── nav_bar.dart
│   ├── footer.dart
│   └── product_card.dart
└── ...
```

## Testing

This project includes a suite of unit and widget tests to ensure code quality and functionality.

- **To run all tests:**
  ```sh
  flutter test
  ```

## Contributing

Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".

1.  Fork the Project
2.  Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3.  Commit your Changes (`git commit -m '''Add some AmazingFeature'''`)
4.  Push to the Branch (`git push origin feature/AmazingFeature`)
5.  Open a Pull Request

