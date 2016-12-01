#!/usr/bin/python
gene_indices = set()
f1 = open("gene_list.tsv", "r")
for index in f1:
    gene_indices.add(int(index))
print gene_indices

f2 = open("golub_test7129_processed.tsv", "r")
f_out = open("golub_test50.tsv", "w")
line_number = 1
for line in f2:
    if line_number in gene_indices:
        f_out.write(line)
    line_number += 1
print line_number
f1.close()
f2.close()
f_out.close()
