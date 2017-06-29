import numpy as np
import pysam as ps
import scipy.io
from glob import glob
import datetime


filepath = '/broad/blainey_lab/Lily/WoykeMDA/BWA_SE_DeNovoTW_MG1655_0324/subset/'
# load files matching pattern
files = glob(filepath + '*_sorted_FH.sam')
# sorts in place (changes variable itself)
files.sort()

# pair read 1, read 2
R1R2 = zip(files[0::2], files[1::2])

# these arrays get saved to matlab
# to include a piece of information, make a new array
# these are list comprehensions
rev = [[] for pair in R1R2]
pos = [[] for pair in R1R2]
readname = [[] for pair in R1R2]
readlength=[[] for pair in R1R2]

# enumerate adds the index, then i, (R1, R2) unpacks the index and the R1 and R2 file names
for i, (R1, R2) in enumerate(R1R2):
    samR1 = ps.AlignmentFile(R1, 'r')
    samR2 = ps.AlignmentFile(R2, 'r')
    # fetch gets the actual data, which is an iterator (like a list) for each read
    F1, F2 = samR1.fetch(), samR2.fetch()
    j = 0
    # go through each read and add to arrays
    for read1 in F1:
        # iterator can't do F2[i], have to .next() each element (could do this differently)
        read2 = F2.next()
        # update all the info we're tracking
        # mylist.append(x) adds x to the end of list mylist
        rev[i].append((int(read1.is_reverse), int(read2.is_reverse)))
        pos[i].append((read1.pos, read2.pos))
        readname[i].append((read1.query_name, read2.query_name))
        readlength[i].append((read1.qlen,read2.qlen))
        if read1.query_name != read2.query_name:
            print j, read1.query_name, read2.query_name
            print j-1, readname[-2]
            break
        j += 1
    print "generated %d pairs from files %s, %s" % (j, '\n' + R1, '\n' + R2)

# saves arrays to matlab
output_file = filepath + 'positions_%s' % datetime.datetime.now().strftime("%Y-%m-%d %H_%M_%S")
# put arrays here to include in .mat file
scipy.io.savemat(output_file, {'files': R1R2, 
                                'pos': pos, 
                                'readnames': readname,
                                'readlength': readlength,
                                'reverse': rev})
print "output saved to %s" % output_file