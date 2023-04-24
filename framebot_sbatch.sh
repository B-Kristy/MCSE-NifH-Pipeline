#!/bin/bash --login
########## SBATCH Lines for Resource Request ##########

#SBATCH --time=10:00:00             # limit of wall clock time - how long the job will run (same as -t)
#SBATCH --nodes=8                   # number of different nodes - could be an exact number or a range of nodes (same as -N)
#SBATCH --ntasks=8                 # number of tasks - how many tasks (nodes) that you require (same as -n)
#SBATCH --cpus-per-task=2          # number of CPUs (or cores) per task (same as -c)
#SBATCH --mem-per-cpu=2G       	  # memory required per allocated CPU (or core)
#SBATCH --job-name framebot        # you can give your job a name for easier identification (same as -J)

########## Command Lines for Job Running ##########
module load Conda/3  						### load necessary modules.

cd /mnt/home/kristybr/20230410_Amplicon_KRI13538_PE250		### change to the directory where your code is located.

srun -n 8 framebot.sh        				### call your executable. (use srun instead of mpirun.)



scontrol show job $SLURM_JOB_ID     				### write job information to SLURM output file.
js -j $SLURM_JOB_ID                 				### write resource usage to SLURM output file (powertools command)