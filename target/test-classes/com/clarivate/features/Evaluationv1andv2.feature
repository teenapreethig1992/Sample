@tag58
Feature: EDSP-284 Editorial Workflow V2 can only be started for Journals having SAMPLE or INACTIVE value as Publication Status

@evaluationv1
Scenario: Login to Editorial Page
Given Am on Editoral Page

@evaluationv
Scenario Outline: Validate the creation of new Publication Evaluation for a Journal
Given am on Editorial Home Page with role "<Role>"
When I create a Publication Evaluation task for a journal using "<searchType>" "<searchValue>" "<pubStatus>" "<evalStatus>"
Then Editorial task is initiated in Editorial tool
Examples:
|Role|searchType|searchValue|pubStatus|evalStatus|
|PublicationEvaluator|Search Term|biopharm|Sample|None|

@evaluationv
Scenario Outline: Validate the creation of new Publication Evaluation new workflow for a Journal - AC1
Given am on Editorial Home Page with role "<Role>"
When I create a Publication Evaluation task for a journal for three statuses "<pubStatus>" "<subStatus>" "<evalStatus>"
Then Editorial task is initiated in Editorial tool
Examples:
|Role|pubStatus|subStatus|evalStatus|
|PublicationEvaluator|Sample|None|Content rejected|
|PublicationEvaluator|Sample|Evaluation Request|Content rejected|
|PublicationEvaluator|Inactive|Drop-Jrnl|None|
|PublicationEvaluator|Inactive|Re-Activate|None|
|PublicationEvaluator|Inactive|Suspend|None|

@evaluationv
Scenario Outline: Validate the creation of new Publication Evaluation old workflow for a Journal - AC2
Given am on Editorial Home Page with role "<Role>"
When I create a Publication Evaluation task for a journal for statuses "<pubStatus>" "<evalStatus>"
And I select the products in popup "<product1>" "<product2>"
Then Editorial task is initiated in Editorial tool
Examples:
|Role|pubStatus|evalStatus|product1|product2|
|PublicationEvaluator|Active-Legacy|None|BIOSIS PREVIEWS|CC/ARTS|
|PublicationEvaluator|Active|None|Emerging Sources|CC/LIFE SCIENCES|

@evaluationv2
Scenario Outline: Validate the error in creation of new Evaluation - AC5
Given am on Editorial Home Page with role "<Role>"
When I create a Publication Evaluation task for a journal for three statuses "<pubStatus>" "<subStatus>" "<evalStatus>"
Then the Editorial Evaluation is not allowed due to substatus "<subStatus>"
Examples:
|Role|pubStatus|subStatus|evalStatus|
|PublicationEvaluator|Sample|Cease|None|
|PublicationEvaluator|Sample|Cease|Under evaluation|
|PublicationEvaluator|Inactive|Absorb|None|
|PublicationEvaluator|Inactive|Merge|None|
|PublicationEvaluator|Inactive|Split|None|
|PublicationEvaluator|Inactive|Split|Under evaluation|


@evaluationv1
Scenario Outline: Validate the error for a journal already under evaluation - AC4
Given am on Editorial Home Page with role "<Role>"
When I create a Publication Evaluation task for a journal for three statuses "<pubStatus>" "<subStatus>" "<evalStatus>"
Then the Editorial Evaluation is not allowed due to next eval date "<error>"
Examples:
|Role|pubStatus|subStatus|evalStatus|error|
|PublicationEvaluator|Sample|None|Content approved|Start Publication Evaluation error - Cannot proceed with evaluation until |
|PublicationEvaluator|Sample|None|Content rejected|Start Publication Evaluation error - Cannot proceed with evaluation until |
|PublicationEvaluator|Inactive|Drop-Jrnl|Content rejected|Start Publication Evaluation error - Cannot proceed with evaluation until |
|PublicationEvaluator|Active|None|Content approved|Start Publication Evaluation error - Cannot proceed with evaluation until |
|PublicationEvaluator|Active-Legacy|None|Content rejected|Start Publication Evaluation error - Cannot proceed with evaluation until |

@evaluationv1
Scenario: Quit all browsers
Given I Close all browsers


