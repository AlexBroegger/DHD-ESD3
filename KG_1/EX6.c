#include <stdio.h>

// Convert decimal til binær funktion +  array

void converter(int x, int b){
	int arr[32];
	
	if(x==0){
		printf("0");
		
		return;
	}
	
	int i = 0;
	while(x>0){
		arr[i]=x%b;
		x = x/b;
		i++;
	}
	// Printer i modsat retning
	for (int y=i-1; y>=0 ;y--){
		printf("%d",arr[y]);
	}
	
}

int main()
{
    int x;
	int b;
	// tager input
	printf("Hvilken base?: ");
	scanf("%d", &b);
	printf("Hvilket tal?: ");
	scanf("%d", &x);
	
	converter(x, b);
    return 0;
}