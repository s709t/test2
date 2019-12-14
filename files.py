import calendar;
import time;
import sys

files = 2
if((len(sys.argv) - 1)> 0) :
  files = sys.argv[0]

print(("Creating {} files...").format(files))
while 0 <  files:
  ts = str(calendar.timegm(time.gmtime()))  
  f=open("file"+str(files)+".txt", "a+")
  f.write(ts)
  f.close()
  print(("File {} created...").format(files))
  files -= 1
