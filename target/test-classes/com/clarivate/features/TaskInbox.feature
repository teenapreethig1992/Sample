@tag59
Feature: Publication Evaluation - Task Inbox EDSP-106

@taskinbox
Scenario: Login to Task Inbox Page
Given I navigate to Task Inbox

@taskinbox
Scenario Outline: Validate the new Editorial Triage task in the task inbox
Given the user is on Task Inbox
When I view the tasks created for "<workflowid>"
Then the Editorial Triage task is created in the Task Inbox "<PermId>" "<tasktype>"
And no duplicate editorial.triage record is displayed for a single bundle "<PermId>"
Examples:
|PermId|searchType|searchValue|tasktype|workflowid|
|91604683449|Publication Id|91604683449|editorial.triage|91604683449|

@EDSP-124,@taskinbox
Scenario Outline: Validate the new Editorial Triage UI Page from task inbox
Given the user is on Task Inbox
When I select the editorial triage task in task inbox "<workflowid>" 
Then a new Journal Evaluation page is displayed "<title>" "<header>"
Examples:
|Role|workflowid|title|header|
|PublicationEvaluator|91604683449|Clarivate Digital Experience (CDX): Seed Application|Editorial Triage Criteria|

@taskinbox
Scenario Outline: Validate that product tasks, review  tasks and product popup are not created for new Publication Evaluation
Given the user is on Task Inbox 
When I view the tasks created for "<workflowid>" 
Then the Review and Product tasks should not be created in the task inbox "<workflowid>" 
Examples:
|workflowid|
|91604683449|

@EDSP-148,@taskinbox
Scenario Outline: Validate the JEDI Page from task inbox
Given the user is on Task Inbox 
When I select the editorial triage task in task inbox "<workflowid>"
Then old JEDI page is displayed "<title>" 
Examples:
|Role|workflowid|title|
|PublicationEvaluator|91604735235|Product Evaluation|

@taskinbox
Scenario: Close all Browsers
Given I Close all browsers
