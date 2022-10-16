import spacy
import ast
#download the english library large 
nlp = spacy.load("en_core_web_lg")

from spacy.tokens import DocBin
from tqdm import tqdm

nlp = spacy.blank("en") # load a new spacy model
doc_bin = DocBin()

from spacy.util import filter_spans

with open('D:\\Python Data Science\\NLP\\UPDATED_NLP_COURSE\\NER\\training_data.txt','r') as f:
    data = f.readlines()
    training_data = ast.literal_eval(data[0])

for training_example  in tqdm(training_data): 
    text = training_example['text']
    labels = training_example['entities']
    doc = nlp.make_doc(text) 
    ents = []
    for start, end, label in labels:
        span = doc.char_span(start, end, label=label, alignment_mode="contract")
        if span is None:
            print("Skipping entity")
        else:
            ents.append(span)
    filtered_ents = filter_spans(ents)
    doc.ents = filtered_ents 
    doc_bin.add(doc)

doc_bin.to_disk("D:\\Python Data Science\\NLP\\UPDATED_NLP_COURSE\\NER\\train.spacy")
