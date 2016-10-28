Firefox version - 46

I have created POM - Page Object Model for this assignment. The structure consists of base and test folders.
Base folder consists of business logic in - WebFormUtil.rb file and ObjectRepository.yml file contains all xpaths used in business logic. 
Test folder consists of WebFormTest.rb which contains all executable methods. I have used 'Test Unit' in WebFormTest.rb file.

Test Cases-
1. First test is a negative test case. If the user does not fill the required fields and submits the form, it checks whether
form does not get submitted and appropriate errors are thrown.
2. Second test is to check if the user fills all required information and submits the form, the form gets submitted
successfully.

Execution :-
Go to GUI folder and run command - 'ruby test/WebFormTest.rb' 