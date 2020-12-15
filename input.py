import csv

with open('storage.csv','r') as storagein:
    reader = csv.reader(storagein)
    with open('insert_storage.sql','w') as storageout:
        for row in reader:
            storageout.write("INSERT INTO storage (type, name, price, quantity, update_date, admin_id) VALUES ('{0}','{1}',{2},{3},'{4}',{5});\n".format(row[0],row[1],row[2],row[3],row[4],row[5]))