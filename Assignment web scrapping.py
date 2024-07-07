#!/usr/bin/env python
# coding: utf-8

# In[1]:


pip install requests beautifulsoup4


# In[2]:


pip install selenium


# In[3]:


from selenium import webdriver
from bs4 import BeautifulSoup
import time
import requests

url="https://stackoverflow.com/questions/415511/how-do-i-get-the-current-time-in-python"


# In[4]:


response=requests.get(url)


# In[5]:


soup=BeautifulSoup(response.text,'html.parser')


# In[6]:


soup


# In[18]:


content=soup.find('div',class_='inner-content clearfix')


# In[19]:


content


# In[21]:


content.find_all('div')


# In[22]:


content.find_all('h1')


# In[23]:


content.find_all('a')


# In[24]:


for i in content.find_all('a'):
    print(i)


# In[25]:


question=[]
for i in content.find_all('a'):
    question.append(i.find('a').text)


# In[26]:


question="question-hyperlink"


# In[27]:


questions=soup.find_all('a',class_=question)


# In[28]:


questions


# In[43]:


ques=[]
for i in questions:
    ques.append(i.text)
ques


# In[32]:


answer="hljs language-python"


# In[35]:


answers=soup.find_all('code',class_=answer)


# In[37]:


answers


# In[44]:


ans=[]
for i in answers:
    ans.append(i.text)


# In[45]:


ans


# In[ ]:




