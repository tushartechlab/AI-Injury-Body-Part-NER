# AI-Injury-Body-Part-NER

This repository contains the code related to an NER Model creating code where the input would be textual data that would return us the injury type, cause of injury and the body part which got injured.

There are several challenges that need to be tackled which would be in the process of improving the model. Some of them are as following: 

1. The current model doesn't take care of the multi-word tokens of injuries like : "electric shock". Due to the current processing engine of spacy it only creates spans of tokens, hence it has to be handled in a different way. Optionally all such cases can be converted into a single word like "electric-shock" and then using the Pattern Matching or Phrase Matching process to convert such cases. This processed text will then be passed into the NER model. Similar training data will already be training the model to handle such scenarios.

2. We will need to do lemmatization to the text before we pass it to the model so that the fall, fallen, falling and fell are considered as fall in the final output. So in this case the text that goes into the model already has lemma form of the words before getting final processing. Just an idea as of now, but can be done better later.

3. We need to extend the model to make sure that conflicting verbs don't mix up with each other. Say of example if the text says, "A falling object hit the head of the engineer leading to a head injury". In this case there is a possibility of falling getting converted to lemma fall and hit as well getting categorized as the injury reason. So it is important to make sure how we handle this and where does the injury exactly gets contributed to. One possible solution could be to use lemmatization and point 1 so that falling object gets categorized as the final cause of injury and hit gets categorized as the injury type. But we need to make sure in case of multi injury data extraction happens how do we tackle that.

4. There needs to be handling done in code for cases like slipped as a cause of injury and "slipped disc" as the injury. In this case we need to make sure that if the body part is not given, the post prediction part of the algorithm takes care that slipped disc is categorized automatically as back, if back is not mentioned, because slipped disc is not body part, it is an injury in body. Since it is obvious the administrator might not mention that in the text.


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
