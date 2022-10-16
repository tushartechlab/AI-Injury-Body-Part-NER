import spacy
import pyodbc
nlp = spacy.load("en_core_web_lg")

def lemmatizer(text):
    doc = nlp(text)
    lem_str = text
    for token in doc:
        if token.text.lower() != token.lemma_.lower():
            lem_str = lem_str.replace(token.text, token.lemma_)
    
    return lem_str

server = 'localhost'   
database = 'NLP'   
username = 'sa'   
password = 'Admin@123'   
cnxn = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER='+server+';DATABASE='+database+';UID='+username+';PWD='+ password)  
cursor = cnxn.cursor()  
cursor.execute('select ClaimsID, NewDescription from ner.PhraseDetectionData with(nolock)')
data = cursor.fetchall()
cursor.commit()

for ids, b in data:
    lemma_desc = lemmatizer(b)
    if lemma_desc == "":
        lemma_desc = b
        isaltered = 0
    else:
        isaltered = 1
     
    cursor.execute("insert into ner.LemmatizerData(ClaimsID,OldDescription,NewDescription,isaltered) VALUES (" + "'" + str(ids) + "','" + b + "','" + lemma_desc + "','" + str(isaltered) + "')")
    cursor.commit()
