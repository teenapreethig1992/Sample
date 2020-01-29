Feature: Publication Evaluation - EDSP-181 : ASCA Popup on Quality Evaluation

@quality
Scenario: Login to Task Inbox Page
Given I navigate to Task Inbox
#Given Am on Editoral Page


@quality1
Scenario Outline: Validate the updation of ASCAS for a Journal - 2ASCAS and 6 ASCAS
Given am on Editorial Home Page with role "<Role>"
When I edit a Publication Evaluation task for a journal using "<searchType>" "<searchValue>" "<permId>" on the Editorial tool
And I select the ASCA categories "<ASCAS>"
And I Close current browser
Examples:
|Role|searchType|searchValue|ASCAS|permId|
|PublicationEvaluator|Publication Id|91604695432|AA - Acoustics;AF - Agricultural Economics & Policy|91604739737|
|PublicationEvaluator|Publication Id|91604694259|AA - Acoustics;AF - Agricultural Economics & Policy;AE - Agricultural Engineering;BF - Anthropology;BI - Archaeology;AZ - Andrology|91604739345|


@quality1
Scenario Outline: Validate the ASCA functionality for a Journal  with ASCA selected from JEDI (2 ASCAS and 6 ASCAS)
Given the user is on new editorial Page for "<workflowid>" "<title>"
When all the quality questions are answered as "<answer>"
And user enters the quality text "<text>"
And the user Passes the Quality Evaluation
Then the ASCA Popup will be displayed with selected ASCAs "<ASCA>" and "<message>" 
And task inbox should have the Impact evaluation task triggered "<workflowid>" "<tasktype2>"
Examples:
|workflowid|title|answer|text|ASCA|message|tasktype2|
|91604753880|Clarivate Digital Experience (CDX): Seed Application|Yes|science|AA - Acoustics;AF - Agricultural Economics & Policy|The Quality task has been completed for this publication. Based on the following ASCA Categories selected|evaluation.impact|
|91604720738|Clarivate Digital Experience (CDX): Seed Application|Yes|science|AA - Acoustics;AF - Agricultural Economics & Policy;AE - Agricultural Engineering;BF - Anthropology;BI - Archaeology;AZ - Andrology|The Quality task has been completed for this publication. Based on the following ASCA Categories selected|evaluation.impact|


@quality
Scenario Outline: Validate the ASCA functionality for a Journal  with No ASCA selected from JEDI
Given the user is on new editorial Page for "<workflowid>" "<title>"
When all the quality questions are answered as "<answer>"
And user enters the quality text "<text>"
And the user Passes the Quality Evaluation
Then the ASCA error Popup will be displayed "<message>"
Examples:
|workflowid|title|answer|text|message|
|91604683426|Clarivate Digital Experience (CDX): Seed Application|Yes|science|No ASCA categories are selected for the current publication, kindly confirm the ASCA category and try again.|


@quality
Scenario Outline: Validate the ASCA functionality for a Journal  with 7 ASCAs selected from JEDI and Quality eval passes
Given the user is on new editorial Page for "<workflowid>" "<title>"
When all the quality questions are answered as "<answer>"
And user enters the quality text "<text>"
And the user Passes the Quality Evaluation
Then the ASCA error Popup will be displayed "<message>"
Examples:
|workflowid|title|answer|text|message|
|91604752293|Clarivate Digital Experience (CDX): Seed Application|Yes|science|A maximum of 6 ASCA categories can be selected for a journal.|



@quality1
Scenario Outline: Validate the ASCA functionality When Quality evaluation is failed for journal with 2 ASCAS and a journal with 6 ASCAS
Given the user is on new editorial Page for "<workflowid>" "<title>"
When all the quality questions are answered as "<answer>" 
And user enters the quality text "<text>"
And the user Fails the quality evaluation
Then task should not be present in Task inbox "<workflowid>"
Examples:
|workflowid|title|answer|text|
|91604739161|Clarivate Digital Experience (CDX): Seed Application|Yes|science|
|91604691644|Clarivate Digital Experience (CDX): Seed Application|Yes|science|

@quality1
Scenario Outline: Validate the Quality Evaluation functionality while cancelling ASCA popup
Given the user is on new editorial Page for "<workflowid>" "<title>"
When the user answers the questions and passes the Quality evaluation "<answer>" "<text>"
And the user cancels the ASCA popup
Then the user should be on the Quality evaluation page "<title>" "<header>"
Examples:
|workflowid|title|answer|text|header|
|91604684317|Clarivate Digital Experience (CDX): Seed Application|Yes|science|Quality Evaluation Criteria|

@quality
Scenario: Quit all browsers
Given I Close all browsers