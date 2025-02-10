# Task 2 - Country Info with Theme Customization

## 📌 Overview

This task is part of the Mobile-Desktop Track for Stage 2. Your objective is to build a mobile application that displays a list of countries and their details, while also offering theme customization (light/dark mode). The app should integrate with the Country API to fetch data and be deployed to Appetize.io for online testing.

## ✨ Requirements

### **Platform & Language**
- **Flutter (Dart)** is recommended for this task.

### **Core Functionality**
- **Country List:**
  - Fetch a list of countries from the provided Country API.
  - Display the list in a scrollable view.
  - Include a search bar to filter countries by name.
  
- **Country Details:**
  - When a country is selected, show detailed information including:
    - Country name
    - States/Provinces (if available)
    - Flag image
    - Population
    - Capital city
    - Country code and continent
  
- **Theme Customization:**
  - Implement a toggle (or switch) to change between light and dark themes.
  - Ensure the selected theme applies consistently across all screens.

- **Responsive Design:**
  - The UI must adapt gracefully to various screen sizes and orientations.

### **Deployment**
- Build the app for the web (using `flutter build web`).
- Deploy the build to Appetize.io.
- Provide a demo link for testing on different devices and browsers.

## 🚀 Deliverables

1. **Source Code & Documentation:**
   - Publish the complete, well-documented source code on a public GitHub Gist or repository.
   - Include inline comments explaining the logic (especially for API integration and theme handling).

2. **Demo:**
   - Provide a link to the deployed version of the app on Appetize.io.

## 🛠️ Development & Testing

1. **Implementation:**
   - Develop the country list screen with a search bar.
   - Create a country details screen to display the fetched data.
   - Integrate the Country API for dynamic data fetching.
   - Implement a global theme provider to handle theme toggling.
  
2. **Testing:**
   - Test API calls with different input cases.
   - Verify UI responsiveness across various devices and simulators.
   - Ensure that the theme toggle updates the entire app consistently.

3. **Documentation:**
   - Include clear instructions on how to set up, run, and test the application locally.

## 📜 Dependencies

- **Flutter SDK**
- **Dart Packages:**  
  - `http` for API communication  
  - `provider` (or an alternative state management solution) for managing theme state  
  - Optional: `cached_network_image` (or similar) for optimized flag image loading
