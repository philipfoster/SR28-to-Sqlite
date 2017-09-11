# SQLite SR28 Import Tool

This is a simple project which imports food nutritional data from the USDA and stores it in a sqlite database
to be queried later. 

Link to dataset:
https://www.ars.usda.gov/northeast-area/beltsville-md/beltsville-human-nutrition-research-center/nutrient-data-laboratory/docs/sr28-download-files/ 

# Running the project
1. Install sqlite3 and python 2
2. Clone the repository
3. [Click to download](https://www.ars.usda.gov/ARSUserFiles/80400525/Data/SR/SR28/dnload/sr28asc.zip) the dataset from USDA website.
4. Execute the following commands to add the data to the database
  ```
  > cd path/to/repository
  > mkdir data
  > cd data/
  > wget https://www.ars.usda.gov/ARSUserFiles/80400525/Data/SR/SR28/dnload/sr28asc.zip 
  > unzip sr28asc.zip
  > cd .. 
  > sqlite3 sr28.db ".read createtables.sql"
  > chmod +x setupdb.py
  > ./setupdb.py
  ```
