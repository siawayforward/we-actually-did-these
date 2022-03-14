from collections import Counter
from string import punctuation

"""
Given a document (string) and a sentence (string),
determine if the sentence can be constructed from the
letters and numbers in the text document.

  document = "A bunch of text from today's newspaper!"

  sentence = "Scary note"
  out = true

  sentence = "Even scarier note"
  out = false // no 'v's, no 'i's, not enough 'e's
"""

puncs = [i for i in punctuation]

def get_sentence(document, sentence):
    # not enough characters to even evaluate, so stop
    if len(document) < len(sentence):
        return False
    else:
        # remove punctuations, we dont care
        doc_no_punctuation = "".join(i for i in document if i.isalpha())
        sent_no_punctuation = "".join(i for i in sentence if i.isalpha())
        
        # count characters in the both, and this is not a case-sensitive process so standardize case
        doc_count = Counter(doc_no_punctuation.lower())
        sent_count = Counter(sent_no_punctuation.lower())

        # check if we have enough characters to make the sentence
        result = False
        for i,v in sent_count.items():
            try:
                if doc_count[i] >= v:
                    result = True
                else:
                    # if there's not enough characters, stop
                    return False
            except: # the letter is not in the string to begin with so we can't make the sentence
                return False
    
    # return result
    return result
    
# test generic, not case sensitive
# we dont care about punctuation or white spaces
# we assume that each document is always going to be one long string, no things to combine

if __name__ == '__main__':
    doc = 'A bunch of text from today\'s newspaper!'
    sent = 'Scary note'
    print('\ntest generic assumptions:', get_sentence(doc,sent), '\nExpected = True')
    assert get_sentence(doc,sent) == True

    # test for a false one
    doc = 'A bunch of text from today\'s newspaper!'
    sent = 'Even scarier note'
    print('\ntest a false case:', get_sentence(doc,sent), '\nExpected = False')
    assert get_sentence(doc,sent) == False

    # what if the document is a smaller string than the sentence?
    doc = 'test'
    sent = 'I am a database engineer'
    print('\ntest document shorter than sentence:', get_sentence(doc,sent), '\nExpected = False')
    assert get_sentence(doc,sent) == False

    # test for punctuations
    doc = "what's it like now?ce"
    sent = "it''''''''s nice"
    print('\ntest punctuations:', get_sentence(doc,sent), '\nExpected = True')
    assert get_sentence(doc,sent) == True
