#!/bin/bash
#
#SBATCH -p hpc-bio-ampere
#SBATCH --chdir=/home/alumno08/lab1
#SBATCH -J advanced
#SBATCH --cpus-per-task=1
#SBATCH --output fastqc-output.std
#SBATCH --mail-type=NONE    #END/START/NONE
#SBATCH --mail-user=MAIL@um.es

module load fastqc/0.11.8
module load jdk/1.8.0
echo APARTADO 1
echo
echo Version de fastqc:
fastqc -v
echo
echo APARTADO 2
echo
echo Tiempo que tarda fastqc en abrir archivos *.fastq secuencialmente:
time for sample in "Sample*.fastq"; do
echo
echo $sample
echo
fastqc $sample
echo
done
echo
echo APARTADO 3
echo
echo Tiempo que tarda fastqc en ejecutar 10 veces cada fichero *.fastq:
echo
time for sample in "Sample*fastq"; do
	for (( i=1; i <= 10; i++ )); do
	fastqc $sample
	done
done

module unload fastqc/0.11.8

