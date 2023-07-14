/*To Simulate Sequential file allocation Strategy*/
//Program:
#include<stdio.h>
#include<string.h>

int main() {
    int st[20], b[20], b1[20], ch, i, j, n, blocks[20][20], sz[20];
    char F[20][20], S[20];

    printf("\nEnter no. of Files: ");
    scanf("%d", &n);

    for (i = 0; i < n; i++) {
        printf("\nEnter file %d name: ", i + 1);
        scanf("%s", F[i]);
        printf("\nEnter file %d size (in kb): ", i + 1);
        scanf("%d", &sz[i]);
        printf("\nEnter Starting block of %d: ", i + 1);
        scanf("%d", &st[i]);
        printf("\nEnter blocksize of File %d (in bytes): ", i + 1);
        scanf("%d", &b[i]);
    }

    for (i = 0; i < n; i++)
        b1[i] = (sz[i] * 1024) / b[i];

    for (i = 0; i < n; i++) {
        for (j = 0; j < b1[i]; j++)
            blocks[i][j] = st[i] + j;
    }

    do {
        printf("\nEnter the Filename: ");
        scanf("%s", S);

        for (i = 0; i < n; i++) {
            if (strcmp(S, F[i]) == 0) {
                printf("\nFname\tStart\tNblocks\tBlocks\n");
                printf("\n\n");
                printf("%s\t%d\t%d\t", F[i], st[i], b1[i]);
                for (j = 0; j < b1[i]; j++)
                    printf("%d->", blocks[i][j]);
            }
        }

        printf("\n\n");
        printf("\nDo you want to continue (Y/n)? ");
        scanf(" %c", &ch);

        if (ch != 'Y' && ch != 'y')
            break;
    } while (1);

    return 0;
}
/*
OUTPUT:
/tmp/UpFJzvaGSK.o
Enter no. of Files: 2
Enter file 1 name: F1
Enter file 1 size (in kb): 20
Enter Starting block of 1: 2
Enter blocksize of File 1 (in bytes): 500
Enter file 2 name: F2
Enter file 2 size (in kb): 10
Enter Starting block of 2: 3
Enter blocksize of File 2 (in bytes): 300
Enter the Filename: F2
Fname	Start	Nblocks	Blocks


F2	3	34	3->4->5->6->7->8->9->10->11->12->13->14->15->16->17->18->19->20->21->22->23->24->25->26->27->28->29->30->31->32->33->34->35->36->


Do you want to continue (Y/n)? n

*/
