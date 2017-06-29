
import scipy.io
from collections import defaultdict
import numpy as np
import scipy.signal as signal
import matplotlib.pyplot as plt
import pandas as pd

import os
import subprocess
import re



listRandomSeed=[0,1,2,3,4,5,6,7,8,9]
header=[0,1,2]



txt = """
    Filename	20X	10X	5X
    SRR1614004	0.181	0.091	0.045
    SRR1614005	0	0	0.712
    SRR1614006	0.228	0.114	0.057
    SRR1614007	0	0.798	0.399
    SRR1614016	0.092	0.046	0.023
    SRR1614017	0.13	0.065	0.033
    SRR1614018	0.149	0.075	0.037
    SRR1614019	0.16	0.08	0.04
    SRR1614020	0.066	0.033	0.017
"""


with open('DeBourcyDownSampling.tsv', 'w') as fh:
    fh.write(txt)    
    
LXdMFT=pd.read_csv('DeBourcyDownSampling.tsv', sep='\t')
LXdMFT



Title=list(LXdMFT.columns.values)
counter=0
for number in listRandomSeed:
    #print number
    counter+=1
    for ix, (filename,a,b,c) in LXdMFT.iterrows():
        Infile='%s.sort.dup.marked.bam' % filename
        Outfile1='%s_%s_%s.bam' % (filename, Title[1],number)
        Outfile2='%s_%s_%s.bam' % (filename, Title[2],number)
        Outfile3='%s_%s_%s.bam' % (filename, Title[3],number)
        #!samtools view -b -s {a} {Infile} -o {Outfile1}
        get_ipython().system(u'echo samtools view -b -s {a} {Infile} -o {Outfile1}')
        #!samtools view -b -s {b} {Infile} -o {Outfile2}
        get_ipython().system(u'echo samtools view -b -s {b} {Infile} -o {Outfile2}')
        #!samtools view -b -s {c} {Infile} -o {Outfile3}
        get_ipython().system(u'echo samtools view -b -s {c} {Infile} -o {Outfile3}')
    LXdMFT.loc[:,'20X':'5X'] += 1

    if counter == 10:
        print 'end of boostraping'
        break





