@evalfail
Feature: Publication Evaluation - Failure at Editorial triage or Quality or Impact : EDSP-185 EDSP-186 EDSP-187

@evalfail
Scenario: Login to Editorial Page
Given Am on Editoral Page

@evalfail
Scenario Outline: Validate the creation of new Publication Evaluation for a Journal with Pub Status and eval status
Given am on Editorial Home Page with role "<Role>"
When I create a Publication Evaluation task for a journal for statuses "<pubStatus>" "<evalStatus>"
Then Editorial task is initiated in Editorial tool
And I Close current browser
Examples:
|Role|pubStatus|evalStatus|
|PublicationEvaluator|Sample|None|

@evalfail
Scenario Outline: Validate the Editorial Triage functionality for editorial which fails the criteria
Given I navigate to Task Inbox
When the user navigates to new editorial Page for "<tasktype1>" 
And all the triage questions are answered as "<answer>" 
And the user Fails the editorial triage
Then the task should not be present in the Task inbox
Examples:
|answer|tasktype1|
|No|editorial.triage|

@evalfail
Scenario Outline: Validate if the status is reflected after Editorial triage fails 
Given Am on Editoral Page
When I edit Publication Evaluation task for a journal using "<searchType>" on the Editorial tool
Then I view the publication evaluation status for triage failure "<evalstatus>" "<PCS>" "<Notes>"
And I Close current browser
Examples:
|Role|searchType|evalstatus|PCS|Notes|
|PublicationEvaluator|Publication Id|Content rejected|None|Evaluation completed at Editorial Triage Step|


@evalfail
Scenario Outline: Validate the creation of new Publication Evaluation for a Journal with Pub Status and eval status
Given Am on Editoral Page
When I create a Publication Evaluation task for a journal for statuses "<pubStatus>" "<evalStatus>"
Then Editorial task is initiated in Editorial tool
And I Close current browser
Examples:
|Role|pubStatus|evalStatus|
|PublicationEvaluator|Sample|None|

@evalfail
Scenario Outline: Validate the Editorial Triage functionality for editorial which passes the criteria
Given I navigate to Task Inbox
When the user navigates to new editorial Page for "<tasktype1>" 
And all the triage questions are answered as "<answer>"
And the user Passes the editorial triage 
Then task inbox should have the Quality evaluation triggered "<tasktype2>"
Examples:
|answer|tasktype1|tasktype2|
|Yes|editorial.triage|evaluation.quality|

@evalfail
Scenario Outline: Validate the Quality Evaluation functionality which fails the criteria
Given the user navigates to new editorial Page for "<tasktype1>" 
When all the quality questions are answered as "<answer>" 
And user enters the quality text "<text>" 
And the user Fails the quality evaluation
Then the task should not be present in the Task inbox
Examples:
|answer|tasktype1|text|
|Yes|evaluation.quality|science|

@evalfail
Scenario Outline: Validate if the status is reflected after Quality evaluation fails 
Given Am on Editoral Page
When I edit Publication Evaluation task for a journal using "<searchType>" on the Editorial tool
Then I view the publication evaluation status "<evalstatus>" "<PCS>" "<Notes>"
Examples:
|Role|searchType|evalstatus|PCS|Notes|
|PublicationEvaluator|Publication Id|Content rejected|None|Evaluation completed at Quality Evaluation Step - Fail|

@evalfail
Scenario: Quit all browsers
Given I Close all browsers
