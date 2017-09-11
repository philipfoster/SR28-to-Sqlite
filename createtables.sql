-- create tables for the database 

BEGIN TRANSACTION;


-- food group description file
CREATE TABLE IF NOT EXISTS fd_group (
    FdGrp_Cd VARCHAR(4) PRIMARY KEY,
    FdGrp_Desc VARCHAR(60) NOT NULL,
    FOREIGN KEY (FdGrp_Cd) REFERENCES food_des(FdGrp_Cd)
);

-- food description file
CREATE TABLE IF NOT EXISTS food_des (
    NDB_No VARCHAR(5) PRIMARY KEY,
    FdGrp_Cd VARCHAR(4) NOT NULL,
    Long_Desc VARCHAR(200) NOT NULL,
    Shrt_Desc VARCHAR(60) NOT NULL,
    ComName VARCHAR(100),
    ManufacName VARCHAR(65),
    Survey VARCHAR(1) DEFAULT 'N',
    Ref_desc VARCHAR(135),
    Refuse INTEGER,
    SciName VARCHAR(65),
    N_Factor REAL, 
    Pro_Factor REAL,
    Fat_Factor REAL,
    CHO_Factor REAL,
    FOREIGN KEY (FdGrp_Cd) REFERENCES fd_group(FdGrp_Cd),
    FOREIGN KEY (NDB_No) REFERENCES nut_data(NDB_No),
    FOREIGN KEY (NDB_No) REFERENCES weight(NDB_No),
    FOREIGN KEY (NDB_No) REFERENCES footnote(NDB_No),
    FOREIGN KEY (NDB_No) REFERENCES langual(NDB_No)
);

-- LanguaL factors description file
CREATE TABLE IF NOT EXISTS "langdesc" (
    Factor_Code VARCHAR(5) PRIMARY KEY,
    Description VARCHAR(140) NOT NULL,
    FOREIGN KEY (Factor_Code) REFERENCES langual(Factor_Code)
);

-- LanguaL factor file
CREATE TABLE IF NOT EXISTS "langual" (
    NDB_No VARCHAR(5),
    Factor_Code VARCHAR(5),
    PRIMARY KEY (NDB_No, Factor_Code),
    FOREIGN KEY (NDB_No) REFERENCES food_des (NDB_No),
    FOREIGN KEY (Factor_Code) REFERENCES langdesc(Factor_Code)
);

-- Nutrient definition file
CREATE TABLE IF NOT EXISTS "nutr_def" (
    Nutr_No VARCHAR(3) PRIMARY KEY,
    Units VARCHAR(7) NOT NULL,
    Tagname VARCHAR(20),
    NutrDesc VARCHAR(60) NOT NULL,
    Num_Dec VARCHAR(1) NOT NULL,
    SR_Order INTEGER NOT NULL,
    FOREIGN KEY (Nutr_No) REFERENCES nut_data (Nutr_No)
);


-- Weight file
CREATE TABLE IF NOT EXISTS "weight" (
    NDB_No VARCHAR(5),
    Seq VARCHAR(2),
    Amount REAL NOT NULL,
    Msre_Desc VARCHAR(84) NOT NULL,
    Gm_Wgt REAL NOT NULL,
    Num_Data_Pts INTEGER,
    Std_Dev REAL,
    PRIMARY KEY (NDB_No, Seq),
    FOREIGN KEY (NDB_No) REFERENCES food_des (NDB_No),
    FOREIGN KEY (NDB_No) REFERENCES nut_data (NDB_No)
);

-- Nutrient data file
CREATE TABLE IF NOT EXISTS "nut_data" (
    NDB_No VARCHAR(5) NOT NULL,
    Nutr_No VARCHAR(3) NOT NULL,
    Nutr_Val REAL NOT NULL,
    Num_Data_Pts INTEGER NOT NULL,
    Std_Error REAL,
    Src_Cd VARCHAR(2) NOT NULL,
    Deriv_Cd VARCHAR(4),
    Ref_NDB_No VARCHAR(5),
    Add_Nutr_Mark VARCHAR(1),
    Num_Studies INTEGER, 
    Min REAL,
    Max REAL, 
    DF INTEGER,
    Low_EB REAL,
    Up_EB REAL,
    Stat_cmt VARCHAR(10),
    AddMod_Date VARCHAR(10),
    CC VARCHAR(1),
    PRIMARY KEY (NDB_No, Nutr_No),
    FOREIGN KEY (NDB_No) REFERENCES food_des (NDB_No),
    FOREIGN KEY (Ref_NDB_No) REFERENCES food_des (NDB_No),
    FOREIGN KEY (NDB_No) REFERENCES weight (NDB_No),
    FOREIGN KEY (NDB_No) REFERENCES footnote (NDB_No),
    FOREIGN KEY (NDB_No) REFERENCES datsrcln (NDB_No),
    FOREIGN KEY (Nutr_No) REFERENCES datsrcln (Nutr_No),
    FOREIGN KEY (Nutr_No) REFERENCES nutr_def (Nutr_No),
    FOREIGN KEY (Src_Cd) REFERENCES src_cd (Src_Cd),
    FOREIGN KEY (Deriv_Cd) REFERENCES deriv_cd (Deriv_Cd)
);

-- Source code file
CREATE TABLE IF NOT EXISTS "src_cd" (
    Src_Cd VARCHAR(2) PRIMARY KEY,
    SrcCd_Desc VARCHAR(60) NOT NULL,
    FOREIGN KEY (Src_Cd) REFERENCES nut_data (Src_Cd)
);

-- Data derivation code description file
CREATE TABLE IF NOT EXISTS "deriv_cd" (
    Deriv_Cd VARCHAR(4) PRIMARY KEY,
    Deriv_Desc VARCHAR(120) NOT NULL,
    FOREIGN KEY (Deriv_Cd) REFERENCES nut_data (Deriv_Cd)
);

-- Sources of data link file
CREATE TABLE IF NOT EXISTS "datsrcln" (
    NDB_No VARCHAR(5),
    Nutr_No VARCHAR(3),
    DataSrc_ID VARCHAR(6),
    PRIMARY KEY (NDB_No, Nutr_No, DataSrc_ID),
    FOREIGN KEY (NDB_No) REFERENCES nut_data (NDB_No),
    FOREIGN KEY (Nutr_No) REFERENCES nut_data (Nutr_No),
    FOREIGN KEY (DataSrc_ID) REFERENCES data_src (DataSrc_ID)
);

-- Sources of data file
CREATE TABLE IF NOT EXISTS "data_src" (
    DataSrc_ID VARCHAR(6) PRIMARY KEY,
    Authors VARCHAR(255),
    Title VARCHAR(255) NOT NULL,
    Year VARCHAR(4),
    Journal VARCHAR(135),
    Vol_City VARCHAR(16),
    Issue_State VARCHAR(5),
    Start_Page VARCHAR(5),
    End_Page VARCHAR(5)
);

-- footnote file
CREATE TABLE IF NOT EXISTS "footnote" (
    NDB_No VARCHAR(5) NOT NULL,
    Footnt_No VARCHAR(4) NOT NULL,
    Footnt_Typ VARCHAR(1) NOT NULL,
    Nutr_No VARCHAR(3),
    Footnt_Txt VARCHAR(200) NOT NULL,
    FOREIGN KEY (NDB_No) REFERENCES food_des (NDB_No),
    FOREIGN KEY (NDB_No) REFERENCES nut_data (NDB_No)
);

COMMIT ;