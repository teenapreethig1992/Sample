Feature: Publication Evaluation - New workflow EDSP-83 - Quality User Interface - Questions to be answered in the UI

@quality1
Scenario: Login to Task Inbox Page
Given I navigate to Task Inbox

@EDSP-189,@quality1
Scenario Outline: Validate the Quality Evaluation Task in the Task Inbox
Given the user is on Task Inbox
When I view the tasks created for "<workflowid>" 
Then the Quality Evaluation task is created in the Task Inbox "<workflowid>" "<TaskType>"
Examples:
|workflowid|TaskType|
|91604739437|evaluation.quality|

@EDSP-189,@quality1
Scenario Outline: Validate the Quality Evaluation UI Page for New Evaluation
Given the user is on Task Inbox
When I select the Evaluation task in the task inbox "<workflowid>"
Then a new Journal Evaluation page is displayed "<title>" "<header>"
Examples:
|workflowid|title|header|
|91604739437|Clarivate Digital Experience (CDX): Seed Application|Quality Evaluation Criteria|

@EDSP-191,@quality1
Scenario Outline: Validate the Quality Evaluation functionality for new Page which passes the criteria
Given the user is on new editorial Page for "<workflowid>" "<title>"
When all the quality questions are answered as "<answer>"
And user enters the quality text "<text>" 
Then both buttons should be enabled
Examples:
|workflowid|title|answer|text|
|91604739437|Clarivate Digital Experience (CDX): Seed Application|Yes|science|

@EDSP-192,@quality1
Scenario Outline: Validate the Quality Evaluation functionality which passes the criteria
Given the user is on new editorial Page for "<workflowid>" "<title>"
When all the quality questions are answered as "<answer>"
And user enters the quality text "<text>" 
And the user Passes the Quality Evaluation
Then task inbox should have the Impact evaluation task triggered "<workflowid>" "<tasktype>"
Examples:
|workflowid|title|answer|tasktype|text|
|91604712283|Clarivate Digital Experience (CDX): Seed Application|Yes|evaluation.impact|science|

@EDSP-193,@quality1
Scenario Outline: Validate the Quality Editorial functionality for which fails the criteria - Some answers equals No
Given the user is on new editorial Page for "<workflowid>" "<title>"
When not all the quality questions are answered Yes 
|Questions																			    	| Response |
|Editorial Board Structure consistent with the journal scope and contents of the journal?	| No	   |
|Peer Reviewed?																				| Yes 	   |
|Validity of Statements																		| Yes  	   |
|Content Relevance																			| Yes	   |
|Grant Support Details																		| Yes	   |
|Adherence to Community Standards															| No	   |
|Authors in the journal consistent with the journal scope and contents						| Yes	   |
|Acceptable Journal Self-Citation Rate														| No	   |
And user enters the quality text "<text>" 
And the user Fails the quality evaluation
Then task should not be present in Task inbox "<workflowid>"
Examples:
|workflowid|title|text|
|91604720017|Clarivate Digital Experience (CDX): Seed Application|science|

@quality1
Scenario: Quit all browsers
Given I Close all browsers
