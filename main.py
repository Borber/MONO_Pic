# -*- coding: utf-8 -*-
from time import strftime, localtime
import requests
import re

url="http://mmmono.com/group/100044/"
r = requests.get(url).content
pic_url = re.findall('img src="(.*?)"',r.decode('utf-8'),re.S)[2]
r = requests.get(pic_url)
with open(strftime('./P/%Y%m%d',localtime()) + '.png', 'wb') as f:
    f.write(r.content)
