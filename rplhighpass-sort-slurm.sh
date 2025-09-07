#!/bin/bash
#SBATCH --job-name=rplhps
#SBATCH --output=rplhps-slurm.%A.out
#SBATCH --error=rplhps-slurm.%A.err
#SBATCH --cpus-per-task=1
#SBATCH --time=2:00:00

/data/miniconda3/bin/conda init
source ~/.bashrc
envarg=`/data/src/PyHipp/envlist.py`
conda activate $envarg

python -u -c "import PyHipp as pyh; \
import time; \
t0 = time.time(); \
print(time.localtime()); \
pyh.RPLHighPass(saveLevel=1); \
from PyHipp import mountain_batch; \
mountain_batch.mountain_batch(); \
from PyHipp import export_mountain_cells; \
export_mountain_cells.export_mountain_cells(); \
print(time.localtime()); \
print(time.time()-t0);"

conda deactivate 
/data/src/PyHipp/envlist.py $envarg

