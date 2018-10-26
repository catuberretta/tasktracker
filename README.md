The Task Tracker is an web application meant for multi-user task tracking.

In my Task Tracker, a user can register with just a name so that way they can return and log in back to their account. Once they have an account, they can create, edit and delete tasks. These tasks can be assigned by them to themselves or other people. To track the amount spent, a user can put in the time in 15 minute increments and when the task is completed, they can mark it as so.

For Track Trasker 2.0, we now have managers! Now a manager can see a task report in the very same page as all of the tasks. This is a fast and simple way to see both the tasks of their underlings in comparison to all tasks. This can be a good way to see if perhaps as a manager, you've assigned the majority of tasks or you've assigned too little tasks and your underlings need more work. Personally, I love the collapse feature. 

In order for a user to track their time, they can simply click the START TIME button and once they're done, click END TIME. This is a way to capture authentically how much time they spent on a task. They are also able to capture this if they work on intervals. By seeing at what times they've started and ended upon several work sessions, they can perhaps pick up on patterns and see exactly when they worked on the task. 

When designing the database, I wanted the tracking of users to be as simple as possible which is why the user table has one field: username. Since the relationship between a user and tasks was one to many, each task had a field that was associated to a user id to keep track of who it was assigned to. The website uses user ID's as a way to track users more than usernames to make sure there was no ambiguity between users.
