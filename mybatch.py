#!/bin/env python

'''
usage:
 mybatch [options] [--] <script>...

options:
 --mem <string>            memory 
 --cores <number>          number of cores
 --time <time>             time
 --error <file>            error file
 --stdout <file>           stdout file

'''

from docopt import docopt
import subprocess


arguments = docopt(__doc__)
#jobids = arguments['--dependency']
mem = arguments['--mem']
cores = arguments['--cores']
time = arguments['--time']
error = arguments['--error']
stdout = arguments['--stdout']
jobids = arguments['<script>']
jscript = jobids.pop(-1)

if __name__ == '__main__':
    import json
    with open("confile.json","a") as ofil:
        json.dump(docopt(__doc__),ofil,indent = 4)

if not jobids == []:
    jobids = ":".join(jobids)
    

import sys
sdir = sys.path[0]
subprocess.Popen("sbatch {mem} {cores} {time} {error} {stdout} {djobs} {jscript} | cut -f 4- -d ' '"
                 .format(sdir = sdir, mem = "--mem=" + mem if mem is not None else "",
                         cores = "-c " +  cores if cores is not None else "",
                         time= "--time=" + time if time is not None else "",
                         error= "-e " + error if error is not None else "",
                         stdout = "-o " + stdout if stdout is not None else "",
                         djobs = "--dependency=afterok:" + jobids if not jobids == [] else "",
                         jscript = jscript), shell = True)
