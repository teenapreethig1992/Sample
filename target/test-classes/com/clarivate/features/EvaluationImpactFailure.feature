Feature: Publication Evaluation - Failure at Impact evaluation : EDSP-187

@impactfail1
Scenario: Login to Editorial Page
Given I navigate to Task Inbox
#Given Am on Editoral Page

@impactfail
Scenario Outline: Validate the creation of new Publication Evaluation for a Journal
Given am on Editorial Home Page with role "<Role>"
When I create a Publication Evaluation task for a journal for statuses "<pubStatus>" "<evalStatus>"
Then Editorial task is initiated in Editorial tool
Examples:
|Role|pubStatus|evalStatus|
|PublicationEvaluator|Sample|None|

@impactfail
Scenario Outline: select ASCA
Given am on Editorial Home Page with role "<Role>"
When I edit Publication Evaluation task for a journal using "<searchType>" on the Editorial tool
When I select the ASCA categories "<ASCAS>"
And I Close Edit Publication browser
Examples:
|Role|ASCAS|searchType|
|PublicationEvaluator|AA - Acoustics;AF - Agricultural Economics & Policy|Publication Id|

@impactfail
Scenario Outline: Validate the Editorial Triage functionality for editorial which passes the criteria
Given I navigate to Task Inbox
When the user navigates to new editorial Page for "<tasktype1>" 
And all the triage questions are answered as "<answer>"
And the user Passes the editorial triage 
Then task inbox should have the Quality evaluation triggered "<tasktype2>"
Examples:
|answer|tasktype1|tasktype2|
|Yes|editorial.triage|evaluation.quality|

@impactfail
Scenario Outline: Validate the Quality Evaluation functionality which passes the criteria
Given the user navigates to new editorial Page for "<tasktype1>"
When all the quality questions are answered as "<answer>" 
And user enters the quality text "<text>" 
And the user confirms the ASCA selection "<ASCAS>"
Then task inbox should have the Impact evaluation triggered "<tasktype2>" 
Examples:
|answer|tasktype1|tasktype2|text|ASCAS|
|Yes|evaluation.quality|evaluation.impact|science|AA - Acoustics;AF - Agricultural Economics & Policy|

@impactfail
Scenario Outline: Validate the Impact Evaluation functionality which passes the criteria
Given the user fails the multiple impact tasks created "<tasktype>"
Then the task should not be present in the Task inbox
Examples:
|answer|tasktype|
|Yes|evaluation.impact|

@impactfail
Scenario Outline: Validate if the status is reflected after Quality evaluation fails 
Given am on Editorial Home Page with role "<Role>"
When I edit Publication Evaluation task for a journal using "<searchType>" on the Editorial tool
Then I view the publication evaluation status "<evalstatus>" "<PCS>" "<Notes>"
Examples:
|Role|searchType|evalstatus|PCS|Notes|
|PublicationEvaluator|Publication Id|Content approved|None|Evaluation completed at Impact Evaluation Step - Accepted for ESCI|

@impactfail1
Scenario: Quit all browsers
Given I Close all browsers
