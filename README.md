The Task Tracker is an web application meant for multi-user task tracking.

In my Task Tracker, a user can register with just a name so that way they can return and log in back to their account. Once they have an account, they can create, edit and delete tasks. These tasks can be assigned by them to themselves or other people. To track the amount spent, a user can put in the time in 15 minute increments and when the task is completed, they can mark it as so.

For Track Trasker 2.0, we now have managers! 

When designing the database, I wanted the tracking of users to be as simple as possible which is why the user table has one field: username. Since the relationship between a user and tasks was one to many, each task had a field that was associated to a user id to keep track of who it was assigned to. The website uses user ID's as a way to track users more than usernames to make sure there was no ambiguity between users.