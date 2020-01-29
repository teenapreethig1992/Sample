Feature: Publication Evaluation - EDSP-181 : ASCA Popup on Quality Pass

@Tascaquality
Scenario: Login to Task Inbox Page
Given I navigate to Task Inbox

@ascaquality1
Scenario Outline: Validate the ASCA functionality for a Journal  with ASCA selected from JEDI
Given the user is on new editorial Page for "<workflowid>" "<title>"
When the user answers the questions and passes the Quality evaluation "<answer>" "<text>" 
Then the ASCA Popup will be displayed with selected ASCAs "<ASCA>" and "<message>"
Examples:
|workflowid|title|answer|text|ASCA|message|
|91604716116|Clarivate Digital Experience (CDX): Seed Application|Yes|science|AA;AF|The Quality task has been completed for this publication . Based on the following ASCA Categories selected , Impact tasks would been created for|

@ascaquality1
Scenario Outline: Validate the ASCA functionality for a Journal  with No ASCA selected from JEDI
Given the user is on new editorial Page for "<workflowid>" "<title>"
When the user answers the questions and passes the Quality evaluation "<answer>" "<text>"
Then the ASCA error Popup will be displayed "<message>"
Examples:
|workflowid|title|answer|text|message|
|91604709307|Clarivate Digital Experience (CDX): Seed Application|Yes|science|ASCA is not selected for the current publication, kindly confirm the ASCA and try again|

@ascaquality1
Scenario Outline: Validate the Quality Evaluation functionality with ASCA which passes the criteria
Given the user is on new editorial Page for "<workflowid>" "<title>"
When the user answers the questions and passes the Quality evaluation "<answer>" "<text>"
And the user confirms the selected ASCAs in the popup "<ASCA>"
And task inbox should have the Impact evaluation task triggered "<workflowid>" "<tasktype>" 
Examples:
|workflowid|title|answer|text|ASCA|
|91604729400|Clarivate Digital Experience (CDX): Seed Application|Yes|science|AA;AF|

@ascaquality1
Scenario Outline: Validate the Quality Evaluation functionality while cancelling ASCA popup
Given the user is on new editorial Page for "<workflowid>" "<title>"
When the user answers the questions and passes the Quality evaluation "<answer>" "<text>"
And the user cancels the ASCA popup
Then the user should be on the Quality evaluation page "<title>" "<header>"
Examples:
|workflowid|title|answer|text|header|
|91604709307|Clarivate Digital Experience (CDX): Seed Application|Yes|science|Quality Evaluation Criteria|


@ascaquality1
Scenario Outline: Validate the Quality Evaluation functionality while user changes the ASCAs in JEDI
Given the user selects the ASCAs in JEDI for "<workflowid>" "<ASCA>"
And the user is on new editorial Page for "<workflowid>" "<title>"
When the user answers the questions and passes the Quality evaluation "<answer>" "<text>"
Then the ASCA Popup will be displayed with selected ASCAs "<ASCA>" and "<message>"
Examples:
|workflowid|title|answer|text|ASCA|message|
|91604729400|Clarivate Digital Experience (CDX): Seed Application|Yes|science|AA;AF|The Quality task has been completed for this publication . Based on the following ASCA Categories selected , Impact tasks would been created for|


@ascaquality1
Scenario: Quit all browsers
Given I Close all browsers
