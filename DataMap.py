#! /usr/bin/python


class DataMap:
    table_name = ""
    columns = []

    def __init__(self, tbl, cols):
        self.table_name = tbl
        self.columns = cols


# map file name to a DataMap object
db_map = {
    "FD_GROUP.txt": DataMap("fd_group", [
        "FdGrp_Cd",
        "FdGrp_Desc"
    ]),

    "DATSRCLN.txt": DataMap("datsrcln", [
        "NDB_No",
        "Nutr_No",
        "DataSrc_ID"
    ]),

    "DERIV_CD.txt": DataMap("deriv_cd", [
        "Deriv_Cd",
        "Deriv_Desc"
    ]),

    "FOOD_DES.txt": DataMap("food_des", [
        "NDB_No",
        "FdGrp_Cd",
        "Long_Desc",
        "Shrt_Desc",
        "ComName",
        "ManufacName",
        "Survey",
        "Ref_desc",
        "Refuse",
        "SciName",
        "N_Factor",
        "Pro_Factor",
        "Fat_Factor",
        "CHO_Factor"
    ]),

    "FOOTNOTE.txt": DataMap("footnote", [
        "NDB_No",
        "Footnt_No",
        "Footnt_Typ",
        "Nutr_No",
        "Footnt_Txt"
    ]),

    "LANGDESC.txt": DataMap("langdesc", [
        "Factor_Code",
        "Description"
    ]),

    "LANGUAL.txt": DataMap("langual", [
        "NDB_No",
        "Factor_Code"
    ]),

    "NUT_DATA.txt": DataMap("nut_data", [
        "NDB_No",
        "Nutr_No",
        "Nutr_Val",
        "Num_Data_Pts",
        "Std_Error",
        "Src_Cd",
        "Deriv_Cd",
        "Ref_NDB_No",
        "Add_Nutr_Mark",
        "Num_Studies",
        "Min",
        "Max",
        "DF",
        "Low_EB",
        "Up_EB",
        "Stat_cmt",
        "AddMod_Date",
        "CC"
    ]),

    "NUTR_DEF.txt": DataMap("nutr_def", [
        "Nutr_No",
        "Units",
        "Tagname",
        "NutrDesc",
        "Num_Dec",
        "SR_Order"
    ]),

    'WEIGHT.txt': DataMap("weight", [
        "NDB_No",
        "Seq",
        "Amount",
        "Msre_Desc",
        "Gm_Wgt",
        "Num_Data_Pts",
        "Std_Dev"
    ]),

    'DATA_SRC.txt': DataMap("data_src", [
        "DataSrc_ID",
        "Authors",
        "Title",
        "Year",
        "Journal",
        "Vol_City",
        "Issue_State",
        "Start_Page",
        "End_Page"
    ]),

    'SRC_CD.txt': DataMap("src_cd", [
        "Src_Cd",
        "SrcCd_Desc"
    ])

}
