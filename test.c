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
 	// int number = 0;

    // printf("Enter a number:");
    // scanf("%d", &number);

    // switch (number) {
    // case 10:
    //     printf("number is equals to 10\n");
    //     break;
    // case 50:
    //     printf("number is equal to 50\n");
    //     break;
    // case 100:
    //     printf("number is equal to 100\n");
    //     break;
    // default:
    //     printf("number is not equal to 10, 50 or 100\n");
    // }
	return 0;
}
