# Good Reader: The Back End

This Rails app was designed to handle the database and API for Good Reader, a reading organizer that places books into three categories. Books placed in any of the three lists are persisted in the database. Enjoy your read!

## Contents

- [Essential Gems](#essentual-gmes)
- [Installation](#installation)
- [Models](#models)
- [Future Development](#future-development)

## Essential Gems

This app was created by running ```rails new gr-backedn --api --database=postgresql```, which prepared the application to perform as an API and to be configured for postgreSQL databases.

## Installation

To get started with this application, fork and clone the repository to your hard drive. ```CD``` into the project folder and run ```bundle install```. Once the gems have been installed, run ```rails db:create``` to establish the database. Make sure you have [postgreSQL](https://postgresapp.com/) installed and already running. Next, run ```rails db:migrate``` to build your database tables and relationship. Run ```rails start``` once the database has been set up to host the backend on your local server. If you're hosting both the front-end and back-end applications locally, also make sure you change the necessary URL variables in the React application so that changes will reflect your personal database.

## Models

There are three models that Good Reader utilizes:

### List

The ```List``` model belongs a User. When a user account is created, the three default lists of "Read", "Currently Reading", and "Want to Read" are also created attached to that particular user.

### Book

The ```Book``` model hold all the data related to all books saved to a list.

### User

The ```User``` model handles all aspects of user accounts, including login/signup. *Although bcrypt is in the gemfile, there is no password encryption in the app*. Additionally, when a user is created, default lists are also created an attached.

## Future Development

### Secure Login

Adding password encryption and handling sessions with JSON Web Tokens.
