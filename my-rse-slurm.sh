#!/bin/bash
#SBATCH --job-name=rse
#SBATCH --output=rse-slurm.%A.out
#SBATCH --error=rse-slurm.%A.err
#SBATCH --cpus-per-task=1
#SBATCH --time=2:00:00

python -u -c "import PyHipp as pyh; \
import time; \
import os; \
t0 = time.time(); \
print(time.localtime()); \
os.chdir('sessioneye'); \
pyh.RPLSplit(SkipLFP=False, SkipHighPass=False); \
print(time.localtime()); \
print(time.time()-t0);"

