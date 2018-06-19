# download article HTML DOM and list all urls

import urllib2
import re

url = 'https://pl.wikipedia.org/wiki/Adolf_Hitler'

response = urllib2.urlopen(url)
dom_content = response.read()


anchor_link_regex = r'<a.*>.*<\/a>'

anchor_link_list = re.findall(anchor_link_regex, dom_content)

anchor_link_info_regex = r'.*href=\"(.*?)\".*?title=\"(.*?)\".*?'

anchor_link_info_list = dict()

for line in anchor_link_list:
    result = re.search(anchor_link_info_regex, line)
    if(result != None):
        anchor_link_info_list[result.group(2)] = result.group(1)


for key, value in anchor_link_info_list.items():
    print(key + " - " + value)
