#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=8GB
#SBATCH --time=7-00:00:00
#SBATCH --job-name=lee_wave_IBM
#SBATCH --mail-type=END
#SBATCH --mail-user=sd3201@nyu.edu
#SBATCH --output=slurm_%j.out
#SBATCH --array=10,11,12,13

module purge
module load matlab/2021a

cd /scratch/sd3201/lee_wave_IBM

matlab -nodisplay -r "ib2D_$SLURM_ARRAY_TASK_ID; exit()" -logfile "$SLURM_ARRAY_TASK_ID.log" 
exit
