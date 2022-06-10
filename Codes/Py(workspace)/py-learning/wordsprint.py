fin = open('words.txt')

#打印words中所有单词
'''for line in fin:
    word = line.strip()
    print(word)
'''
def avoids(word, forbidden):  #直接对forbidde的字母在单词中进行逻辑判断
    for letter in word:
        if letter in forbidden:
            return False;
    return True;


def printlong(file):  #打印大于20的单词
    for line in file:
        word = line.strip()
        if len(word)>20:        
            print(word)

def printnan(file):
    theword = input('input the collect word you donna want\n')
    for line in file:
        word = line.strip()
        if word.find(theword)==-1 :  #搜索不含有e的单词
            print(word)

#以下是abecedarian程序
def is_abecedarian(word):
    previous = word[0]
    for c in word:
        if c < previous:
            return False
        previous = C
    return True

def is_abecedarian2(word):
    if len(word) <= 1:
        return True
    if word[0] > word[1]:
        return False
    return is_abecedarian(word[1:])

def is_abecedarian3(word):
    i = 0
    while i < len(word)-1:
        if word[i+1] < word[i]:
            return False
        i = i+1
    return True
##
def countingAvoid(word,forbidden):
    if avoids(word, forbidden):
        print(word)
forbidden = 'abcde'
countingAvoid(fin, forbidden)