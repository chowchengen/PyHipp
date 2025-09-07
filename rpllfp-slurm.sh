#!/bin/bash
#SBATCH --job-name=rpllfp
#SBATCH --output=rpllfp-slurm.%A.out
#SBATCH --error=rpllfp-slurm.%A.err
#SBATCH --cpus-per-task=1
#SBATCH --time=2:00:00

python -u -c "import PyHipp as pyh; \
import time; \
t0 = time.time(); \
print(time.localtime()); \
pyh.RPLLFP(saveLevel=1); \
print(time.localtime()); \
print(time.time()-t0);"

