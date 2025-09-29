#!/bin/bash
# Submit this script with: sbatch <this-filename>
# SBATCH --time=24:00:00   # walltime
# SBATCH --ntasks=1        # number of processor cores (i.e. tasks)
# SBATCH --nodes=1         # number of nodes
# SBATCH --cpus-per-task=1 # number of processors per task
# SBATCH -J "waveform"         # job name
## /SBATCH -p general      # partition (queue)
# SBATCH -o lffs.%N.%j.out # STDOUT
# SBATCH -e lffs.%N.%j.err # STDERR
# LOAD MODULES, INSERT CODE, AND RUN YOUR PROGRAMS HERE

import PyHipp as pyh; \
pyh.Waveform(saveLevel=1);


aws sns publish --topic-arn arn:aws:sns:ap-southeast-1:217777498295:awsnotify --message "WaveDone"
