#!/bin/bash
#
#SBATCH -p hpc-bio-ampere
#SBATCH --chdir=/home/alumno08/lab1
#SBATCH -J submit_lab1_ampere_alumno08.sh
#SBATCH --cpus-per-task=1
#SBATCH --mail-type=END    #END/START/NONE
#SBATCH --mail-user=soledad.arias@um.es

echo El nombre de la máquina es: 
hostname
echo
echo El nombre del usuario es:
whoami
echo Los comandos se han ejecutado en la ruta:
pwd
echo
echo Estructura de escritorios:
tree -L 1


for (( i=1; i <= 3; i++ ))
do
echo
echo El programa se ha ejecutado $i veces
./helloflops3-AVX
done


cpufetch

