Feature: Publication Evaluation - New workflow EDSP-85 - Impact User Interface - Questions to be answered in the UI

@impact
Scenario: Login to Task Inbox Page
Given I navigate to Task Inbox

@impact
Scenario Outline: Validate the Impact Evaluation Task in the Task Inbox
Given the user is on Task Inbox
When I view the tasks created for "<workflowid>" 
Then the Impact Evaluation task is created in the Task Inbox "<workflowid>" "<TaskType>"
Examples:
|workflowid|TaskType|
|91604739330|evaluation.impact|

@impact
Scenario Outline: Validate the Imapct Evaluation UI Page for New Evaluation
Given the user is on Task Inbox
When I select the Evaluation task in the task inbox "<workflowid>"
Then a new Journal Evaluation page is displayed "<title>" "<header>"
Examples:
|workflowid|title|header|
|91604739330|Clarivate Digital Experience (CDX): Seed Application|Impact Evaluation Criteria|

@impact1
Scenario Outline: Validate the Impact Evaluation functionality for new Page which passes the criteria
Given the user is on new editorial Page for "<workflowid>" "<title>"
When all the impact questions are answered as "<answer>"
Then both buttons should be enabled
Examples:
|workflowid|title|answer|
|91604715199|Clarivate Digital Experience (CDX): Seed Application|Yes|

@impact
Scenario Outline: Validate the Impact Evaluation functionality which passes the criteria
Given the user is on new editorial Page for "<workflowid>" "<title>"
When all the impact questions are answered as "<answer>"
And the user Passes the Impact Evaluation
Then task should not be present in Task inbox "<workflowid>"
Examples:
|workflowid|title|answer|
|91604701849|Clarivate Digital Experience (CDX): Seed Application|Yes|

@impact
Scenario Outline: Validate the Impact Editorial functionality for which fails the criteria - Some answers equals No
Given the user is on new editorial Page for "<workflowid>" "<title>"
When not all the impact questions are answered Yes
|Questions						 					| Response  |
|Positive Comparative Citation Analysis?     		| No        |
|Author Citation Analysis Positive?                 | Yes       |
|Editors Citation Analysis Positive?                | Yes       |
|Content Significance?                              | No        | 
And the user Fails the impact evaluation
Then task should not be present in Task inbox "<workflowid>"
Examples:
|workflowid|title|
|91604731748|Clarivate Digital Experience (CDX): Seed Application|


@impact
Scenario Outline: Validate the Impact Editorial functionality for which fails the criteria - Some answers equals Null and close the page
Given the user is on new editorial Page for "<workflowid>" "<title>"
When not all the impact questions are answered Yes
|Questions						 					| Response  |
|Positive Comparative Citation Analysis?     		| Null      |
|Author Citation Analysis Positive?                 | Yes       |
|Editors Citation Analysis Positive?                | Yes       |
|Content Significance?                              | Null      | 
Then I Close current browser
Examples:
|workflowid|title|
|91604697020|Clarivate Digital Experience (CDX): Seed Application|
|91604757015|Clarivate Digital Experience (CDX): Seed Application|

@impact
Scenario Outline: Validate the Edit Impact Editorial functionality - Viewing the previously filled answers
Given the user is on new editorial Page for "<workflowid>" "<title>"
Then the previously selected answers should be displayed
|Questions						 					| Response   |
|Positive Comparative Citation Analysis?     		| mixed      |
|Author Citation Analysis Positive?                 | Yes	     |
|Editors Citation Analysis Positive?                | Yes     	 |
|Content Significance?                              | mixed      |
Examples:
|workflowid|title|
|91604697020|Clarivate Digital Experience (CDX): Seed Application|


@impact
Scenario Outline:Validate the Edit Impact Editorial functionality - Viewing the previously filled answers and passing it
Given the user is on new editorial Page for "<workflowid>" "<title>"
And the previously selected answers should be displayed
|Positive Comparative Citation Analysis?     		| mixed      |
|Author Citation Analysis Positive?                 | Yes	     |
|Editors Citation Analysis Positive?                | Yes      	 |
|Content Significance?                              | mixed      |
When the user answers remaining questions
|Questions						 					| Response   |
|Positive Comparative Citation Analysis?     		| No         |
|Author Citation Analysis Positive?                 |    	     |
|Editors Citation Analysis Positive?                |       	 |
|Content Significance?                              | Yes        |
Then the user Passes the Impact Evaluation
And task should not be present in Task inbox "<workflowid>"
Examples:
|workflowid|title|
|91604697020|Clarivate Digital Experience (CDX): Seed Application|


@impact
Scenario Outline:Validate the Edit Impact Editorial functionality - Viewing the previously filled answers and rejecting it
Given the user is on new editorial Page for "<workflowid>" "<title>"
Then the previously selected answers should be displayed
|Positive Comparative Citation Analysis?     		| mixed      |
|Author Citation Analysis Positive?                 | Yes	     |
|Editors Citation Analysis Positive?                | Yes      	 |
|Content Significance?                              | mixed      |
When the user answers remaining questions
|Questions						 					| Response   |
|Positive Comparative Citation Analysis?     		| No         |
|Author Citation Analysis Positive?                 |    	     |
|Editors Citation Analysis Positive?                |       	 |
|Content Significance?                              | Yes        |
And the user Fails the impact evaluation
Then task should not be present in Task inbox "<workflowid>"
Examples:
|workflowid|title|
|91604757015|Clarivate Digital Experience (CDX): Seed Application|
 

@impact
Scenario: Quit all browsers
Given I Close all browsers
