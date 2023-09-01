# Using makefile
directories: 
	-mkdir tmp
	-mkdir data

# adding curl command to retrieve inflation data

downloads: 
	# inflation data from International Monetary Fund
	curl "https://www.imf.org/external/datamapper/api/v1/PCPIPCH?periods=2023" -o tmp/inflation.json
	# country code to merge inflation with location data
	curl "https://www.imf.org/external/datamapper/api/v1/countries" -o tmp/countries.json


freshdata: 
	# use node (language) to convert the imf json data to a csv file
	node imf_to_csv.js

# make all command to combine the directories, downloads and fresh data commands into one
all: directories downloads freshdata