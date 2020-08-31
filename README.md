# we_grow

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



## Pages
- Start Up
    - View
        - Splash Logo
    - View Model
        - Gets current user's
        - Navigates you to appropiate screen {Log In, SignUp, Home}
 ## Services
- Authentication
    - State Variables
        - Current User signed in
    - Api Functions
        - Log In
            - [ ] Email, Password
            - [ ] Google
            - [ ] Facebook
            - [ ] Twitter
        - Sign Sign
            - [ ] Email, Password, Verify Password
            - [ ] Google
            - [ ] Facebook
            - [ ] Twitter
        - Log Out
        - Reset Password
            - [ ] Send password reset email
        - Update User Credentials
            - [ ] Email, Password, Role, First Name, Last Name, Image
                - [ ] Update User Object -> First Name, Last Name, Image, Role
                - [ ] Update FirebaseUser Object -> Email, password
        - User Logged In? 
            - [ ] Get FirebaseUser from FirebaseAuth and populate current user field
        - Private Populate Current User
            - [ ] Use Firebase User to get the user with matching uid from the users collection from firestore
- Firestore
    - State Variables
    - Api Functions
        - User
            - [ ] Create
            - [ ] Read
            - [ ] Update
            - [ ] Delete
        - Job Post
            - [ ] Create
            - [ ] Read
            - [ ] Update
            - [ ] Delete
            - [ ] Query Job Post
        - Private - > Job Post Card (Only Includes User Image, Post Tittle, User Name, Location)
            - (Job Post and Job Post Card contain the same id, Created updated and Deleted at the same time, Job Post Card is used to load Job Post)
            - [ ] Create
            - [ ] Read
            - [ ] Update
            - [ ] Delete
            - [ ] Query Job Post
        - Messages
            - [ ] Create message thread (first time sending message to user)
            - [ ] Send message
            - [ ] Read messages thread
- Camera
    - State Variables
    - Api Functions
        - [ ] Load Camera Image
        - [ ] Load Gallery Image
        - [ ] Crop Image

- Dialog
    - State Variables
    - Api Functions
        - [ ] Information Dialog
        - [ ] Confirmation Dialog

- Navigation
    - State Variables
        - Navigation Key
    - Api Functions
        - [ ] pop
        - [ ] Navigate To 