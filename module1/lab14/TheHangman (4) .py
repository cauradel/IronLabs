#!/usr/bin/env python
# coding: utf-8

# In[2]:


import random
choices = ["apple", "banana", "strawberry", "pear","ironhack" ,"dress", "france" ]

word = random.choice(choices)
attempts = 7
display = ""
guess = ""

for l in word:
    display = display + "_ "
    
name = input("What is your name? ")

print("Good Luck ! ", name)
   
print(">> Welcome to The Hangman! Ready? <<")

while attempts > 0:
    print("Word to guess : ", display)
    proposition = input("Enter a letter: ")
    
    if proposition in word:
        guess = guess + proposition
        print("Well done!")
    else:
        attempts = attempts -1
        print("No :(  Number of attempts left: ", attempts)
        
    if attempts==0:
        print("You lost..Try again?")
        print(" ==========Y= ")
    if attempts<=1:
        print(" ||/       |  ")
    if attempts<=2:
        print(" ||        0  ")
    if attempts<=3:
        print(" ||       /|\ ")
    if attempts<=4:
        print(" ||       / \  ")
    if attempts<=5:                    
        print("/||           ")
    if attempts<=6:
        print("==============\n")
        
        
    display = ""
    for x in word:
        if x in guess:
            display += x + " "
        else:
            display += "_ "
            
    if "_" not in display:
        print("YOU WON")
        break


# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:




