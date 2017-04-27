# GitLogReader
Reads your git log to pull out only relevant productivity information.

Using git to manage time spent on a task can be an effective tool in managing your time, productivity, and assessing the viability
of future projects. Proper git practices will lead you to generating better estimates for your projects, as well as allow you
to learn from the mistakes you have previously made through proper documentation.

This log reader takes your git log, removing all of the "fluff" to leave you with just the information that you want.


### To use this reader you must commit in a specific format.

The first line of every commit should go as follows: <b>time {task} {duration}</b><br>
Where time is the string "time", {tasks} is the name of the task you have been working on, and {duraction} is how long you have been working
on this task since your last commit.

The next line should be your commit message detailing any problems you are encountering, or any solutions you have found (which is generally a good commit practice).

All tasks that you are working on should be recorded in the knowntasks file.
