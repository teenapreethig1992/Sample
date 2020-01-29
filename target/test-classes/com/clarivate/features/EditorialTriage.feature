@tag58
Feature: Publication Evaluation - New workflow EDSP-81 - Editorial Triage

@newpage
Scenario: Login to Task Inbox Page
Given I navigate to Task Inbox

@newpage
Scenario Outline: Validate the Editorial Triage functionality for editorial which passes the criteria
Given the user is on new editorial Page for "<workflowid>" "<title>"
When all the triage questions are answered as "<answer>"
Then PASS button should be enabled
Examples:
|Role|workflowid|title|answer|
|PublicationEvaluator|91604726522|Clarivate Digital Experience (CDX): Seed Application|Yes|

@newpage
Scenario Outline: Validate the Editorial Triage functionality for editorial which fails the criteria
Given the user is on new editorial Page for "<workflowid>" "<title>"
When all the triage questions are answered as "<answer>"
Then Reject button should be enabled 
Examples:
|Role|workflowid|title|answer|
|PublicationEvaluator|91604726522|Clarivate Digital Experience (CDX): Seed Application|No|

@newpage
Scenario Outline: Validate the Editorial Triage functionality for editorial which fails the criteria - Some answers equals No
Given the user is on new editorial Page for "<workflowid>" "<title>" 
When not all the triage questions are answered Yes 
| Question               			| Response |
| Article Types?        			| Yes      |
| Titles and Abstracts in English?	| Yes      |	
| Cited References         			| Yes      |
| Clarity of Language     			| No 	   |
| Timeliness               			| Yes      |
| Website Functionality   			| No       |
| Ethics Statement  	   			| Yes      |
| Ethical Statements Available		| Yes      |
| Editorial Affiliation Details		| No       |
| Authors Affiliation Details 		| Yes      |
Then Reject button should be enabled 
Examples:
|Role|workflowid|title|
|PublicationEvaluator|91604726522|Clarivate Digital Experience (CDX): Seed Application|

@newpage
Scenario Outline: Validate the Editorial Triage functionality for editorial which passes the criteria
Given the user is on new editorial Page for "<workflowid>" "<title>" 
When all the triage questions are answered as "<answer>"
And the user Passes the editorial triage 
Then task inbox should have the Quality evaluation task triggered "<workflowid>" "<tasktype>"
Examples:
|Role|workflowid|title|answer|tasktype|
|PublicationEvaluator|91604726522|Clarivate Digital Experience (CDX): Seed Application|Yes|evaluation.quality|


@newpage
Scenario Outline: Validate the Editorial Triage functionality for editorial which fails the criteria - Some answers equals No
Given the user is on new editorial Page for "<workflowid>" "<title>"
When not all the triage questions are answered Yes 
| Question               			| Response |
| Article Types?        			| Yes      |
| Titles and Abstracts in English?	| Yes      |	
| Cited References         			| Yes      |
| Clarity of Language     			| No 	   |
| Timeliness               			| Yes      |
| Website Functionality   			| No       |
| Ethics Statement  	   			| Yes      |
| Ethical Statements Available		| Yes      |
| Editorial Affiliation Details		| No       |
| Authors Affiliation Details 		| Yes      |
And the user Fails the editorial triage
Then task should not be present in Task inbox "<workflowid>" 
Examples:
|workflowid|title|
|91604683783|Clarivate Digital Experience (CDX): Seed Application|

@newpage
Scenario: Quit all browsers
Given I Close all browsers


