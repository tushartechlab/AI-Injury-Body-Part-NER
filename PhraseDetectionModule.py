#import spacy
import spacy
import pyodbc   
from spacy.matcher import Matcher

#create nlp pipeline by loading the english core large dictionary
nlp = spacy.load('en_core_web_lg')

#create the matcher object
matcher = Matcher(nlp.vocab)

#create first matcher pattern
matcher_base1 = 'electric-shock'
pattern1 = [{'LOWER' : 'electrocuted'}]
pattern2 = [{'LOWER' : 'electric'}, {'IS_PUNCT' : True, 'OP' : '*'}, {'LOWER' : 'shock'}]
pattern3 = [{'LOWER' : 'electric'}, {'IS_PUNCT' : True, 'OP' : '*'}, {'LOWER' : 'current'}]
pattern4 = [{'LOWER' : 'electrocution'}]

#create second matcher pattern
matcher_base2 = 'slipped-disc'
pattern5 = [{'LOWER' : 'slippeddisc'}]
pattern6 = [{'LOWER' : 'slipped'}, {'IS_PUNCT' : True, 'OP' : '*'}, {'LOWER' : 'disc'}]

#adding the matcher patterns to the matcher object
matcher.add(matcher_base1,[pattern1,pattern2,pattern3,pattern4], on_match = None)
matcher.add(matcher_base2,[pattern5,pattern6], on_match = None)


server = 'localhost'   
database = 'NLP'   
username = 'sa'   
password = 'Admin@123'   
cnxn = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER='+server+';DATABASE='+database+';UID='+username+';PWD='+ password)  
cursor = cnxn.cursor()  
cursor.execute('select ID, ClaimsDesc from ClaimsDescInfo with(nolock)')
data = cursor.fetchall()
cursor.commit()

for ids, b in data:
    doc = nlp(b)
    found_matches = matcher(doc)
    if len(found_matches) > 0:
        for match_id, start,end in found_matches:
            matcher_base = nlp.vocab.strings[match_id]
            span = doc[start:end]
            new_str = b.replace(span.text,matcher_base)
            isaltered = 1
    else:
        new_str = b
        isaltered = 0
     
    cursor.execute("insert into ner.PhraseDetectionData(ClaimsID,OldDescription,NewDescription,isaltered) VALUES (" + "'" + str(abc) + "','" + b + "','" + new_str + "','" + str(isaltered) + "')")
    cursor.commit()
