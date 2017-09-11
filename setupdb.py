#! /usr/bin/python

import sqlite3
import string
import glob

from DataMap import db_map

db_path = "sr28.db"
path = "./data/"

conn = sqlite3.connect(db_path)
conn.text_factory = str


def read_file(file_obj):
    # type: (file) -> string
    ret = []
    for line in file_obj.readlines():
        # clean up the line
        line = line.strip("\r\n")
        line = line.translate(None, "~")
        ret.append(line)

    return ret


def build_query(line, datamap):
    """
    Build a query to insert a line from the text file

    :type line: String
    """
    query = "INSERT INTO \'{0}\' (".format(datamap.table_name)
    # add column names to insert statement
    count = 0
    for v in datamap.columns:
        count += 1
        query += v
        if count != len(datamap.columns):
            query += ","
        else:
            query += ")"

    query += " VALUES ("

    for i in range(0, count):
        query += "?"
        if i == count - 1:
            query += ");"
        else:
            query += ", "

    values = []

    for entry in line.split("^"):
        values.append(entry)

    return query, values


def main():
    print("Inserting a lot of data. This may take a while.")

    try:
        start = len(path)
        for filename in glob.glob(path + "*.txt"):
            print(filename[start:])
            data = db_map[filename[start:]]
            for line in read_file(open(filename)):
                query, values = build_query(line, data)
                # print("Executing query: " + query + " with values " + str(values))
                conn.cursor().execute(query, values)

        conn.commit()
        print("Done")
    except conn.Error, e:
        print("Could not insert data.\n\n Error: " + str(e))
        conn.rollback()


if __name__ == '__main__':
    main()
