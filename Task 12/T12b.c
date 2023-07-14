/*To implement indexed file allocation method.*/
//PROGRAM:
#include<stdio.h>
#include<string.h>

int n;

int main() {
    int b[20], b1[20], i, j, blocks[20][20], sz[20];
    char F[20][20], S[20], ch;

    printf("\nEnter no. of Files: ");
    scanf("%d", &n);

    for (i = 0; i < n; i++) {
        printf("\nEnter file %d name: ", i + 1);
        scanf("%s", F[i]);
        printf("\nEnter file %d size (in kb): ", i + 1);
        scanf("%d", &sz[i]);
        printf("\nEnter blocksize of File %d (in bytes): ", i + 1);
        scanf("%d", &b[i]);
    }

    for (i = 0; i < n; i++) {
        b1[i] = (sz[i] * 1024) / b[i];
        printf("\n\nEnter blocks for file %d", i + 1);
        for (j = 0; j < b1[i]; j++) {
            printf("\nEnter the %d block: ", j + 1);
            scanf("%d", &blocks[i][j]);
        }
    }

    do {
        printf("\nEnter the Filename: ");
        scanf("%s", S);

        for (i = 0; i < n; i++) {
            if (strcmp(F[i], S) == 0) {
                printf("\nFname\tFsize\tBsize\tNblocks\tBlocks\n");
                printf("\n\n");
                printf("%s\t%d\t%d\t%d\t", F[i], sz[i], b[i], b1[i]);
                for (j = 0; j < b1[i]; j++)
                    printf("%d->", blocks[i][j]);
            }
        }

        printf("\n\n");
        printf("\nDo you want to continue (Y/n)? ");
        scanf(" %c", &ch);

    } while (ch != 'n' && ch != 'N');

    return 0;
}
/*
OUTPUT:-
/tmp/UpFJzvaGSK.o
Enter no. of Files: 2
Enter file 1 name: F1
Enter file 1 size (in kb): 1
Enter blocksize of File 1 (in bytes): 512
Enter file 2 name: F2
Enter file 2 size (in kb): 1
Enter blocksize of File 2 (in bytes): 512
Enter blocks for file 1
Enter the 1 block: 1000
Enter the 2 block: 1001
Enter blocks for file 2
Enter the 1 block: 2000
Enter the 2 block: 2001
Enter the Filename: F1
Fname	Fsize	Bsize	Nblocks	Blocks


F1	1	512	2	1000->1001->


Do you want to continue (Y/n)?:n 
*/
