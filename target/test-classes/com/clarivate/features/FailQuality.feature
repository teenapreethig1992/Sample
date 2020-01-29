Feature:  EDSP-185 - Journal Update after evaluation is completed as Fail in Quality Evaluation Step

@failqulity
Scenario: Login to Task Inbox Page
Given I navigate to Task Inbox

@failquality
Scenario Outline: Validate the Journal Update after evaluation is completed as Fail in Quality Evaluation Step - Some answers equals No
Given the user is on new editorial Page for "<workflowid>" "<title>"
When not all the quality questions are answered Yes
|Questions																							|	Response	|
|Editorial Board Structure consistent with the journal scope and contents of the journal?			|	No			|
|Peer Reviewed?																						|	Yes			|
|Validity of Statements																				|	Yes			|
|Content Relevance																					|	Yes			|
|Grant Support Details																				|	Yes			|
|Adherence to Community Standards																	|	No			|
|Authors in the journal consistent with the journal scope and contents								|	Yes			|
|Acceptable Journal Self-Citation Rate																|	No			|
And user enters the quality text "<text>" 
And the user Fails the quality evaluation
Then task should not be present in Task inbox "<workflowid>"
Examples:
|workflowid|title|text|
|91604786714|Clarivate Digital Experience (CDX): Seed Application|science| 

@failquality
Scenario Outline: Validate the failed quality task with permid has been updated to the coverage tab in JEDI tool
Given Am on Editoral Page
When I search a Publication Evaluation task for a journal using "<searchType>" "<searchValue>"on the Editorial tool
And select edit publication from action
Then I click on Coverage tab and verify the "<Evaluation Status>", "<Created>", "<Notes>" and "<Next Evaluation Date>"
And PCs should be Null
Examples:
|searchType|searchValue|Evaluation Status|Created|Notes|Next Evaluation Date|
|Publication Id|91604786714|Content Rejected|Teena Preethi Gopi 06-Aug-2019|Evaluation completed at Quality Evaluation Step - Fail|06-Aug-2021|