## Vela Android coding challenge

Hi there! Here is a coding exercise to help us assess your technical skills. Please plan to spend no more than 4 hours on this. We understand we may not be the only company asking for an exercise from you and want to be respectful of your time.


By 4 hours in, please feel free to stop working and explain what refactors / code organization / enhancements you would have made with more time in the SOLUTION.md file.

If you have any questions at any point, please reach us on email.

## Note
Pleae make your changes as small and `atomic` so that we can track and follow your peogress. A single commit for the solution will not be accepted.

## Submission
Please **fork** this repository and commit all your changes to it. When you're done, send us the email with your Github repository URL.

## Task

1. Fork this repository
2. Create a *source* directory for your code.
3. In the *source* directory, please create an Android app that accomplishes the following:
	- Connect to the [Github API](http://developer.github.com/)
	- Find the [rails/rails](http://github.com/rails/rails) repository
	- Find the most recent commits (choose at least 25 or more of the commits)
	- Create a TableView that displays the recent commits by author in a view. 
	- [Click here](example.jpg) for a screenshot mock up of what the final product should look like
4. Commit and Push your code to your forked repository

## Constraints
- After I pushed to github my github acces token credentials were revoked because it was meant to be private so a 401 was returned.
- My tableview need to return a dynamic height this was not done due to time constraint.

## Enhancement
- An authentication page can be created to authenticate each user so a personalized token created to access the github api.
