# Who played last month?
# Use Essentials plugin data and file last modified time

import os
import time

from pathlib import Path
from datetime import date

# Find users logged in within last 30 days
userFilesPath = Path(r"..\plugins\Essentials\userdata").resolve()
daysAgo = 30
targetModifiedTime = time.time() - (daysAgo * 24 * 60 * 60)
targetUserFiles = []
for fileName in os.listdir(userFilesPath):
    fileFullPath = userFilesPath.joinpath(fileName)
    fileModifiedTime = os.path.getmtime(fileFullPath)
    if fileModifiedTime >= targetModifiedTime:
        targetUserFiles.append(fileFullPath)

targetUserNames = []
for userFilePath in targetUserFiles:
    with open(userFilePath, 'r', encoding='utf-8') as file:
        for line in file:
            if line.startswith("last-account-name:"):
                username = line.split(":")[1].strip()
                targetUserNames.append(username)
                break

today = date.today()
todayInYYYYMMDD = today.isoformat()
outputFilePath = Path(r".").joinpath("who_played_last_month_" + todayInYYYYMMDD).with_suffix(".txt").resolve()
with open(outputFilePath, 'w') as file:
    for username in targetUserNames:
        file.write(username + "\n")