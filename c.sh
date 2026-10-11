#!/bin/bash

# Author: Sondos Mohamed Ali
# Created: 11-OCT-2026
# Last Modified: 11-OCT-2026

# Description:
# A Script created for showing how the computer really works, the same algorithm, program lang and compiler
# for two programs but the one is about 10x speed then another.
# It's about CACHE MISSING, when caching, do just the data CPU needs is fetched, but also the data
# addresses are close by will tend to be fetched soon which is called (Spatial Locality).
# IN C lang, The array is stored in ROWS, so when the CPU fetch the data from the RAM to cache
# it fetches the other data near to it in the row.
# This shell script will show you the difference between looping in Row major order & Column major order.

#Usage
# ./c.sh

	 
mkdir -p HPC
cd HPC

for num in 512 1025 2049;do
    echo "#include <stdio.h>
	  #define NUM ${num}
	  int main(){
	    static int c[NUM][NUM], a[NUM][NUM], b[NUM][NUM];
            for(int i = 0; i < NUM;i++)
              for(int j= 0; j < NUM; j++)
                for(int k =0; k< NUM; k++)
                  c[i][k]+= a[i][j] * b[j][k];
	  }">good.c

    echo "#include <stdio.h>
	  #define NUM ${num}
    int main(){
	    static int c[NUM][NUM], a[NUM][NUM], b[NUM][NUM];
            for(int j= 0; j < NUM;j++)
              for(int k= 0; k < NUM; k++)
                for(int i =0; i< NUM; i++)
                  c[i][k]+= a[i][j] * b[j][k];
    }">bad.c

    gcc -O0 good.c -o good.out
    gcc -O0 bad.c -o bad.out
    echo -e "\n----${num}x${num}----"
    echo -e "\e[32mGOOD\e[0m";time ./good.out && echo -e "\n\e[31mBAD\e[0m"; time ./bad.out
done
 

