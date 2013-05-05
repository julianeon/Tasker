Tasker
--------

This to-do list visualization app will borrow freely from a similar app I created with Sinatra, using Google Graphs to display each task as part of a pie chart.

At the moment, a work in progress; highly incomplete.

Check this space frequenly however as it is currently being updated 1+ times a day.

A working Heroku demonstration of this site (currently up to date) is at http://calm-ravine-8199.herokuapp.com/

This to-do app works like this. There are two models, days and tasks; days has many tasks. 

When you create a task, you (currently) have to create it on today's date. 

Created tasks are unstarted. 

To start them, you must press start. 

To stop them, you must press stop.

The tasks index and today page both show the status of tasks. 

Today has only the status of today's tasks.

Tasks that have been started and stopped (i.e., that are complete) will be graphed at the bottom of the tasks and today
pages using Google graphs.
