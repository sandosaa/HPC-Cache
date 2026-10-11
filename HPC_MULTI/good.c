#include <stdio.h>
	  #define NUM 2049
	  int main(){
	    static int c[NUM][NUM], a[NUM][NUM], b[NUM][NUM];
            for(int i = 0; i < NUM;i++)
              for(int j= 0; j < NUM; j++)
                for(int k =0; k< NUM; k++)
                  c[i][k]+= a[i][j] * b[j][k];
	  }
