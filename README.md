# AI-Injury-Body-Part-NER

This repository contains the code related to an NER Model creating code where the input would be textual data that would return us the injury type, cause of injury and the body part which got injured.

There are couple of challenges that need to be tackled which would be in the process of improving the model. Some of them are as following: 

1. We need to extend the model to make sure that conflicting verbs don't mix up with each other. Say of example if the text says, "A falling object hit the head of the engineer leading to a head injury". In this case there is a possibility of falling getting converted to lemma fall and hit as well getting categorized as the injury reason. So it is important to make sure how we handle this and where does the injury exactly gets contributed to. One possible solution could be to use lemmatization and point 1 so that falling object gets categorized as the final cause of injury and hit gets categorized as the injury type. But we need to make sure in case of multi injury data extraction happens how do we tackle that.

2. Currently the Phrase Detection is static and it needs to be done through a file where we provide the patterns and they get dynamically added to the matcher.

3. We also need to implement spell checker before the phrase detection module so that any spelling issues are solved so that nothing is missed out in Phrase Detection, Lemmatizer and NER.

Please Note : The paths, configurations, variables like server, UID, PWD are static defined currently, they need to be replaced using argument list sys.argv[1],sys.argv[2],sys.argv[3] and so on.
When this will be used inside of SSIS package they will be passed as parameters to the execute process task where python process will be called, with first argument as the file and then subsequent arguments which will be UID, PWD and so on. These will be inside SSIS, which will be passed as variables or project parameters which in turn are fetched from the environment veriables configured in SSIS Catalog or SQL Server Job. Locally they can be taken from project parameters.

The entire structure when called through a process will run in the following order and the output of each module will be logged into a table in database :

                                             BASIC DATA FETCHED THROUGH FILES OR DATABASE
                                                                   ↓
                                                                   ↓
                                       THE EXTRACTED TEXT IS SENT TO THE PHRASE DETECTION MODULE
                                                                   ↓
                                                                   ↓
                                            THE OUTPUT IS THEN SENT TO THE LEMMATIZER MODULE
                                                                   ↓
                                                                   ↓
                                  THEN WITH THE PROVIDED TEST DATA, THE NLP MODEL IS CREATED & TRAINED
                                                                   ↓
                                                                   ↓
                        LATER THE LEMMATIZER MODULE OUTPUT TEXT OUTPUT IS THEN SENT INTO CUSTOM NER NLP PIPELINE
                                                                   ↓
                                                                   ↓
                            THE OUTPUT IS THEN STORED IN DATABASE AND MAPPED WITH THE RELEVANT DIMENSION KEYS
