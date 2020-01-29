Feature: Publication Evaluation - Editorial Triage Secondary Questions UI - EDSP-459

@secqnexcel
Scenario: User navigates to the Task Inbox
Given I navigate to Task Inbox

@secqn
Scenario Outline: Validate the Editorial Triage functionality for editorial which passes the criteria
Given the user navigates to new editorial Page for "<tasktype1>"
When user answers the secondary question "<question1>" "<decision>"
|Primarily Scholarly Contents|Yes|
|Majority of Research|No|
When triage questions are answered as below
| Titles and Abstracts in English	| Yes      |	
| Cited References         			| Yes      |
| Clarity of Language     			| Yes 	   |
| Timeliness               			| Yes      |
| Editorial Affiliation Details		| Yes	   |
| Authors Affiliation Details 		| Yes      |
And not all the triage questions are answered Yes 
|Question               			| Response |
|Ethics Statement  	   				| Yes      |
|Ethical Statements Available		| Yes      |
|Website Functionality				| Yes	   |
Examples:
|answer|tasktype1|tasktype2|question1|decision|
|Yes|editorial.triage|evaluation.quality|Article Types|reject|


@secqnexcel1
Scenario Outline: Validate the Editorial Triage functionality for editorial which passes the criteria
Given the user navigates to new editorial Page for "<tasktype1>"
When triage questions are answered from data table "<table>" "<data>"
And not all the triage questions are answered Yes 
|Question               			| Response |
|Ethical Statements Available		| Yes      |
|Website Functionality				| Yes	   |
And the user Passes the editorial triage
Then task inbox should have the Quality evaluation triggered "<tasktype2>"
Examples:
|answer|tasktype1|table|data|tasktype2|
|Yes|editorial.triage|SecQn|Scenario1|evaluation.quality|

@secqnexcel
Scenario Outline: Validate the Editorial Triage functionality for editorial which passes the criteria
Given the user navigates to new editorial Page for "<tasktype1>"
When user answers the secondary question from data table "<question1>" "<decision>" "<table>" "<data1>"
When triage questions are answered from data table "<table>" "<data2>"
And not all the triage questions are answered Yes 
|Question               			| Response |
|Ethical Statements Available		| Yes      |
|Website Functionality				| Yes	   |
And the user Fails the editorial triage
Then the task should not be present in the Task inbox
Examples:
|answer|tasktype1|question1|decision|table|data1|data2|
|Yes|editorial.triage|Article Types|reject|SecQn|Scenario2Sec|Scenario2Prim|

