📋 Task Manager App (Flutter + GetX)

A Flutter-based Task Manager application where users can create an account, log in, and manage their tasks efficiently.
The app supports adding, updating, progressing, completing, canceling, and deleting tasks.
It uses GetX for state management and navigation and is fully integrated with a backend REST API.

🚀 Features

🔐 Authentication

User Registration (Create New Account)

Login

Token-based authentication


📝 Task Management

Add New Task

Update Task Status

New

In Progress

Completed

Canceled

Delete Task

Status-wise Task Listing


🔄 State Management

GetX State Management

Reactive UI using Rx and Obx

Auto refresh when task status changes

Pull-to-refresh support


📱 User Interface

Splash Screen

Bottom Navigation Bar

Clean and simple UI


🛠️ Technologies Used

Flutter

Dart

GetX (State Management & Navigation)

REST API

HTTP Network Requests


📂 Project Structure

lib/

│
├── core/
|   | 
│   ├── network/      # API clients & network requests
|   |   
│   └── utils_style/        # App styles, colors, and utilities
|
│
├── presentation/
|   | 
│   ├── getx/
|   |   |
│   │   └── taskDetailsGetx/
|   |       |
│   │       ├── newTaskGetx.dart
|   |       | 
│   │       ├── progressTaskGetx.dart
|   |       |
│   │       ├── completeTaskGetx.dart
|   |       |
│   │       └── cancelTaskGetx.dart
|   |
│   │
│   └── screen/
|       |
│       ├── onBoarding/
|       |   |
│       │   ├── splashScreen.dart
|       |   |
│       │   ├── loginScreen.dart
|       |   |
│       │   └── registrationScreen.dart
|       |
│       │
│       └── task/
|           |
│           ├── HomeScreen.dart
|           |
│           ├── taskCreateScreen.dart
|           |
│           └── taskList.dart
|
│
└── main.dart


🔄 State Management Details

Each task status has its own GetX controller

Controllers use RxList and RxBool for reactive state

UI updates automatically using Obx()

When a task status changes, all related controllers refresh to keep data in sync


🌐 Backend API

REST-ful API integration

Token-based authentication

Task CRUD operations:

Create Task

Read Tasks (Status-wise)

Update Task Status

Delete Task


▶️ How to Run the Project

Clone the repository

git clone <your-repository-url>

Install dependencies

flutter pub get

Configure backend API

Update API base URL inside:

core/network/apiTaskClient.dart

Run the application

flutter run


📌 Future Improvements

Push Notifications

Task Search and Filtering

Task Statistics & Analytics

Clean Architecture with a single Task Controller

Dark Mode support

👤 Author

Md Salauddin Rony

Flutter Developer

Learning Flutter, GetX, and Clean Architecture

Aspiring Remote & Freelance Developer
