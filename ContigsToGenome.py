import numpy as np
import pysam as ps
import scipy.io
from glob import glob
import datetime


filepath = '/broad/blainey_lab/'
# load files matching pattern
files = glob(filepath + '*.sam')
# sorts in place (changes variable itself)
files.sort()

# these arrays get saved to matlab
# to include a piece of information, make a new array
# these are list comprehensions
rev = [[] for i in files]
pos = [[] for i in files]
readname = [[] for i in files]
querySequence= [[] for i in files]
queryLength= [[] for i in files]

for i, file in enumerate(files):
    finalSequence = ''
    samR1 = ps.AlignmentFile(file, 'r')
    # fetch gets the actual data, which is an iterator (like a list) for each read
    F1 = samR1.fetch()
    j=0;
    # go through each read and add to arrays
    last_pos = 0
    for read1 in F1:
        # iterator can't do F2[i], have to .next() each element (could do this differently)
        # update all the info we're tracking
        # mylist.append(x) adds x to the end of list mylist
        rev[i].append(int((read1.is_reverse)))
        pos[i].append((read1.pos))
        readname[i].append((read1.query_name))
        querySequence[i].append((read1.query_sequence))
        queryLength[i].append((read1.rlen))
#        finalSequence = finalSequence + spacer * (read1.pos - last_pos) + read1.query_sequence
#        last_pos = read1.pos + read1.rlen
    j+=1
#    open(file[:-4] + '_fakegenome.fa', 'w').writelines(['>helloworld', finalSequence])
    print "generated %d alignment from files %s" % (j,'\n' + file)

# saves arrays to matlab
output_file = filepath + 'positions_%s' % datetime.datetime.now().strftime("%Y-%m-%d %H_%M_%S")
# put arrays here to include in .mat file
scipy.io.savemat(output_file, {'files': files,
                                'pos': pos ,
                                'readnames': readname,
                                'reverse': rev,
                                'querySequence':querySequence, 
                                'queryLength': queryLength })
print "output saved to %s" % output_file