#!/bin/bash

# Author: Sondos Mohamed Ali
# Created: 11-OCT-2026
# Last Modified: 11-OCT-2026

# Description:
# The same as last one, but it's for sum 2 matrix.

#Usage
# ./sum_c.sh

	 
mkdir -p HPC_SUM
cd HPC_SUM

for num in 100 1000 10000 15000;do
    echo "#include <stdio.h>
	  #define NUM ${num}
	  int main(){
	    static int c[NUM][NUM], a[NUM][NUM], b[NUM][NUM];
            for(int i = 0; i < NUM;i++)
              for(int j= 0; j < NUM; j++)
                  c[i][j]+= a[i][j] + b[i][j];
	  }">good.c

    echo "#include <stdio.h>
	  #define NUM ${num}
    int main(){
	    static int c[NUM][NUM], a[NUM][NUM], b[NUM][NUM];
            for(int j= 0; j< NUM;j++)
              for(int i= 0; i< NUM; i++)
                  c[i][j]+= a[i][j] + b[i][j];
    }">bad.c

    gcc -O0 good.c -o good.out
    gcc -O0 bad.c -o bad.out
    echo -e "\n----${num}+${num}----"
    echo -e "\e[32mGOOD\e[0m";time ./good.out && echo -e "\n\e[31mBAD\e[0m"; time ./bad.out
done
 
