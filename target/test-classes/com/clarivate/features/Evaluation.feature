Feature: Publication Evaluation - End2End workflow Initiate evaluation,Editorial triage and Quality evaluation

@evaluation
Scenario: Login to Editorial Page
Given Am on Editoral Page
Given I navigate to Task Inbox

@evaluation
Scenario Outline: Validate the creation of new Publication Evaluation for a Journal
Given am on Editorial Home Page with role "<Role>"
When I create a Publication Evaluation task for a journal for statuses "<pubStatus>" "<evalStatus>"
Then Editorial task is initiated in Editorial tool 
Examples:
|Role|pubStatus|evalStatus|
|PublicationEvaluator|Sample|None|

@evaluation
Scenario Outline: select ASCA
Given am on Editorial Home Page with role "<Role>"
When I edit Publication Evaluation task for a journal using "<searchType>" on the Editorial tool
When I select the ASCA categories "<ASCAS>"
And I Close current browser
Examples:
|Role|ASCAS|searchType|
|PublicationEvaluator|AA - Acoustics;AF - Agricultural Economics & Policy;ID - Energy & Fuels;AZ - Andrology|Publication Id|

@evaluation
Scenario Outline: Validate the new Editorial Triage task in the task inbox
Given I navigate to Task Inbox
When I view the evaluation tasks created
Then the Editorial Triage task is created in Task Inbox "<tasktype>"
Examples:
|tasktype|
|editorial.triage|


@evaluation
Scenario Outline: Validate the Editorial Triage functionality for editorial which passes the criteria
Given the user navigates to new editorial Page for "<tasktype1>"
When all the triage questions are answered as "<answer>"
And the user Passes the editorial triage 
Then task inbox should have the Quality evaluation triggered "<tasktype2>"
Examples:
|answer|tasktype1|tasktype2|
|Yes|editorial.triage|evaluation.quality|

@evaluation
Scenario Outline: Validate the Quality Evaluation Task in the Task Inbox
Given the user is on Task Inbox
When I view the evaluation tasks created
Then the Quality Evaluation task is created in Task Inbox "<TaskType>"
Examples:
|TaskType|
|evaluation.quality|

@evaluation
Scenario Outline: Validate the Quality Evaluation functionality which passes the criteria
Given the user navigates to new editorial Page for "<tasktype1>" 
When all the quality questions are answered as "<answer>" 
And user enters the quality text "<text>" 
And the user confirms the ASCA selection "<ASCAS>"
Then task inbox should have the Impact evaluation triggered "<tasktype2>" 
Examples:
|answer|tasktype1|tasktype2|text|ASCAS|
|Yes|evaluation.quality|evaluation.impact|science|AA - Acoustics;AF - Agricultural Economics & Policy;ID - Energy & Fuels;AZ - Andrology|

@evaluation
Scenario Outline: Validate the Impact Evaluation functionality which passes the criteria
Given the user passes the multiple impact tasks created "<tasktype>" 
Then the task should not be present in the Task inbox
Examples:
|answer|tasktype|
|Yes|evaluation.impact|

@evaluation
Scenario: Quit all browsers
Given I Close all browsers


