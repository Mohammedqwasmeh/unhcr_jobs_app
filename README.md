# Jobs App

This repository houses the Flutter codebase for the Jobs mobile app, designed to run on both Android and iOS
platforms. 🚀

## Screenshots

<div style="display: flex; justify-content: space-between;">
    <img src="./app_splash_screen.jpg" style="width: 20%;" alt="Splash Screen"/>
    <img src="./app_loading.jpg" style="width: 20%;" alt="List Loading"/>
    <img src="./app_home_screen.jpg" style="width: 20%;" alt="Home Screen"/>
    <img src="./home_search.jpg" style="width: 20%;" alt="Search List"/>
</div>

<div style="display: flex; justify-content: space-between;">
     <img src="./job_details_screen.jpg" style="width: 20%;" alt="Job Details"/>
    <img src="./no_network.jpg" style="width: 20%;" alt="List Error"/>
    <img src="./empty_list.jpg" style="width: 20%;" alt="Empty List"/>
<!--     <img src="./app_icon.jpg" style="width: 20%; height: 50%" alt="Icon"/> -->
</div>

## Frontend

The frontend of the Jobs App is developed using Flutter version 3.22.2. We have adopted the Bloc state management
pattern to efficiently manage the application's state. The separation of concerns (SoC) architecture is employed,
ensuring a clear distinction between the app's logic and presentation layers.

### State Management

The Bloc pattern provides a structured and predictable way to manage the state of the application. It separates the
presentation layer from the business logic, enhancing maintainability and scalability.

### Architecture

The app follows the Separation of Concerns (SoC) principle, where the logic and presentation layers are distinctly
separated. This promotes code organization, making it easier to understand, test, and maintain.

<br />
<img src="./architecture-proposal.png" style="display: block; margin-left: auto; margin-right: auto; width: 75%;" alt="App Architecture"/>

Feel free to explore the codebase of the Jobs App app! If you have any questions or feedback, don't hesitate to
open an issue or reach out to us.
