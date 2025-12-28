import json
import os
import re

def getCookbook(filepath, start_marker, end_marker, jsonpath):
    capture = False
    lines = []

    with open(filepath, "r", encoding="utf-8") as f:
        for line in f:
            if start_marker in line:
                capture = True
                continue
            if end_marker in line:
                break
            if capture:
                lines.append(line)
    s = "".join(lines).strip() # first read as string
    # str to dict
    parts = re.split(r"###", s) # find everything between ### ... until the next ###
    sectionlist = [p.strip() for p in parts if p.strip()]
    cookbookDict = {}
    for d in sectionlist:
        l = d.split("@")
        print(l[1].strip())
        if len(l) ==2 :
            subdict = dict(re.findall(r"__(\w+)__([\s\S]*?)(?=__\w+__|$)", l[1].strip()))
            cookbookDict[l[0].strip()]=  subdict

    # Load existing JSON data if the file exists
    if os.path.exists(jsonpath):
        with open(jsonpath, "r", encoding="utf-8") as f:
            try:
                existingCookbookDict = json.load(f)
            except json.JSONDecodeError:
                existingCookbookDict = {}
    else:
        existingCookbookDict = {}
    
    existingCookbookDict.update(cookbookDict)
        
    with open (jsonpath, "w") as f:
        json.dump(existingCookbookDict, f, indent=3, ensure_ascii=False) # dict to json
    print("\n cookbook updated @ ~/REPO1/800K/fe1/public/cookbook.json \n")
    return existingCookbookDict

getCookbook(
    os.path.expanduser("~/REPO1/note1.md"),
    "[COOKBOOK-START]",
    "[COOKBOOK-END]",
    os.path.expanduser("~/REPO1/800K/fe1/public/cookbook.json")
)

print(getCookbook)
