# Read the bookmarks file and print the URL for the requested bookmark.
import sys

bookmark = sys.argv[1]
currentName = ""
currentURL = ""
readingType = "name"

with open("bookmarks") as fileobj:
    for line in fileobj:  
       for character in line: 
           if character == "=":
               readingType = "url"
               continue
           if character == "\n":
               if currentName == bookmark:
                   # The requested bookmark was found!
                   print(currentURL)
                   exit()
               # Reset all the values
               readingType = "name"
               currentName = ""
               currentURL = ""
               continue
           if readingType == "name":
               currentName += character
               continue
           if readingType == "url":
               currentURL += character
               
            
            
