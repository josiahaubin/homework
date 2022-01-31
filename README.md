## Elixir SDET homework assigment

- Choose at least 3 three of the options in the list on https://the-internet.herokuapp.com/, and automate at least one test case for each option.
- Bonus: Choose at least 1 request from https://reqres.in/ and write at least one api test for that request (double bonus if this is done in elixir, in the same project as the browser automation portion.)

Hint:
This challenge is to showcase your skill, so it is recommended to spend time your time showcasing coding skills, rather than the quantity of tests that you write.

- When finished, submit the challenge as a github link from your personal github (please keep the name of the repo as "homework")


## Getting Up and Running

- Download the latest version of chromedriver and ensure that your version of chrome is up to date as well
- Run chromedriver
- In a different terminal window or tab, cd into the homework project and you can now execute the command "mix test" and it will run all of the test files in the "test" folder


## Josiah Notes
- Added Tags, to run a specific test file, in cmd/powershell type mix test --only "tag name"
- List of tag names:
    - api_tests
    - entry_ad_tests
    - form_auth_tests
    - hover_tests
- All tests will run with mix test command

- Created a helpers folder, in the idea of the POM, abstracted out code that is reused, or potentially reuseable, so if UI elements change, one place is needed to make the change. There is still work to do here, but these classes should give the idea of what I am trying to accomplish. 