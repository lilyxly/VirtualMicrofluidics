import os
import subprocess
import re

# command line equivalent
referencegenome = '/broad/blainey_lab/Lily/ReferenceGenome/Escherichia_coli_str_K-12_substr_MG1655.fasta'

cmd_to_run = ['bwa', 'mem', referencegenome, 'fwd.fastq', 'rev.fastq']

filepath = '/broad/blainey_lab/Lily/WoykeMDA/HumanFilteredFastq/'

# get all the files
listfiles = os.listdir(filepath)

# filter the file list
R = re.compile('.*fastq*')
listfilesR=filter(R.match,listfiles)

listfilesR.sort()

# pairs up R1 and R2 file names
R1R2list = zip(listfilesR[0::2],listfilesR[1::2])

# loop through all pairs and execute commands
# for loop requires colon, tab each line inside
for R1R2 in R1R2list:
	R1name = R1R2[0]
	R2name = R1R2[1]
	# get string before first underscore (filetag = ex. 1A, 1B, 1C)
	filetag = R1name.split('_')[0]

	# switch input variable[3] to '*._R1*' (cmd_to_run[3])
	cmd_to_run[3] = filepath + R1name
	# switch input variable[4] to '*._R2*' (cmd_to_run[4])
	cmd_to_run[4] = filepath + R2name

	# run bwa mem
	# call command, send stdout (equivalent of >) to file
	# open file with 'w' = write privilege (discard contents if it exists)
	#run bwa sampe to aln and make '*.sam' file
	subprocess.call(cmd_to_run,stdout=open(filetag + '.sam', 'w'))	

	# change run command to Sortsam.jar to created sorted bam file
	cmd_to_run = ['java', '-jar', '/broad/blainey_lab/Lily/Software/picard-tools-1.129/picard.jar', 'SortSam', 'I=2B.sam', 'O=2B.sort.bam', 'SO=coordinate']
	# change input and output variables
	cmd_to_run[4] = 'I=' + filetag + '.sam'
	cmd_to_run[5] = 'O=' + filetag + '.sort.bam'
	# run Sortsam.jar
	subprocess.call(cmd_to_run)

	# change run command to MarkDuplicates.jar to mark duplicate reads
	cmd_to_run[3] = 'MarkDuplicates'
	cmd_to_run[4] = 'I=' + filetag + '.sort.bam'
	cmd_to_run[5] = 'O=' + filetag + '.sort.dup.marked.bam'
	cmd_to_run[6] = 'METRICS_FILE=' + filetag + '_duplicates'
	# run MarkDuplicates
	subprocess.call(cmd_to_run)

	# switch run command back to 'bwa aln' for next loop
	cmd_to_run = ['bwa', 'mem', referencegenome, 'fwd.fastq', 'rev.fastq']



