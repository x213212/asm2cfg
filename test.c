#include <stdio.h>
int __attribute__((noinline))  test2 (int a){
	a=a+1;
	return a;
}
int main(){
	int	test =10;
	printf("%d\n",test);
	printf("%d\n",test2(test));
	int k ;
	if(k > 10)
	printf("%d\n",test2(test));
	else
	printf("%d\n",test);

	return 0;
}
