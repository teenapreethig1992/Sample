@tag58
Feature: Publication Evaluation - New workflow - EDSP-100

@regression
Scenario: Login to Editorial Page
Given Am on Editoral Page


@regression
Scenario Outline: Validate the creation of new Publication Evaluation for a Journal
Given am on Editorial Home Page with role "<Role>"
When I create a Publication Evaluation task for a journal record using "<searchType>" "<searchValue>" "<PermId> "on the Editorial tool
Then Editorial task is initiated in Editorial tool "<PermId> "
And Product pop up is not shown in Editorial Tool
Examples:
|Role|searchType|searchValue|PermId|
|PublicationEvaluator|Publication Id|91604700164|91604700164|


@regression
Scenario Outline: Validate the creation of Publication Evaluation for a Journal which has an evaluation ongoing
Given am on Editorial Home Page with role "<Role>"
When I create a Publication Evaluation task for a journal using "<searchType>" "<searchValue>" "<PermId> "which has an evaluation ongoing
Then the Editorial Evaluation is not allowed in the editorial tool "<Error>" 
Examples:
|Role|searchType|searchValue|PermId|Error|
|PublicationEvaluator|Publication Id|91604700163|91604700163|Start Publication Evaluation error - This publication is already under evaluation|


@skip
Scenario Outline: Validate that product popup are not created for new Publication Evaluation
Given am on Editorial Home Page with role "<Role>"
When I create a Publication Evaluation task for a journal record using "<searchType>" "<searchValue>" "<PermId> "on the Editorial tool
Then Product pop up is not shown in Editorial Tool
Examples:
|Role|searchType|searchValue|PermId|
|PublicationEvaluator|Search Term|journal|91604719710|

@tobetested
Scenario Outline: Validate that roles other than publication evaluator cannot create an evaluation task
Given am on Editorial Home Page with role "<Role>"
When I create a Publication Evaluation task for a journal record using "<searchType>" "<searchValue>" "<PermId> "on the Editorial tool
Then the Editorial Evaluation is not allowed in the editorial tool "<Error>" 
Examples:
|Role|searchType|searchValue|PermId|Error|
|PublicationEvaluator|Search Term|muscle|91604717795|This role is not allowed to initiate evaluation|

@skip
Scenario Outline: Validate the creation of Publication Evaluation for a Journal which has come after corrections from initial evaluation
Given am on Editorial Home Page with role "<Role>"
When I create a Publication Evaluation task for a journal using "<searchType>" "<searchValue>" "<PermId>" which has been evaluated and corrected
Then Editorial task is initiated in Editorial tool "<PermId> "
Examples:
|Role|searchType|searchValue|PermId|tasktype|
|PublicationEvaluator|Search Term|muscle|91604717795|editorial.triage|

@regression
Scenario: Close all Browsers
Given I Close all browsers
