import os, re
logfolder = "./nmon_logs"
allfolders = os.listdir(logfolder)
for x in allfolders:
    file = open(logfolder+"/"+x+"/names.txt","w")
    for y in sorted(os.listdir(logfolder+"/"+x)):
        k = re.findall("nmon$",y)
        if len(k)!=0:
            file.write(y+",\n")