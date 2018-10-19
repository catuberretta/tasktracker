# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     TaskTracker.Repo.insert!(%TaskTracker.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias TaskTracker.Repo
alias TaskTracker.Users.User
Repo.insert!(%User{username: "Catu"})
Repo.insert!(%User{username: "Bob"})

alias TaskTracker.Tasks.Task
Repo.insert!(%Task{assignedUser: "Bob", 
completed: false, 
timeSpent: 60, 
desc: "Create a database that works flawlessly.", 
title: "DB Homework"})

Repo.insert!(%Task{assignedUser: "Catu", 
completed: false, 
timeSpent: 15, 
desc: "Paint it so it can be a pet.", 
title: "Find a rock"})