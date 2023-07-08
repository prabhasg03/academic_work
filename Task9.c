//Task 9 : To implement paging technique of memory management.
//Program:-
#include <stdio.h>

void main() {
    int np, ps, pt[20], nf, la, pn, index, pa, i;

    printf("Enter the number of pages: ");
    scanf("%d", &np);

    printf("Enter the page size: ");
    scanf("%d", &ps);

    printf("Enter the page table:\n");
    for (i = 0; i < np; i++) {
        printf("Page %d: ", i);
        scanf("%d", &pt[i]);
    }

    printf("Enter the number of frames: ");
    scanf("%d", &nf);

    printf("Enter the logical address: ");
    scanf("%d", &la);

    pn = la / ps;
    index = la % ps;

    if (pn >= np) {
        printf("Invalid page number!\n");
        return;
    }

    if (pt[pn] == -1) {
        printf("Page fault occurred!\n");
        return;
    }

    pa = (pt[pn] * ps) + index;
    printf("Physical address is %d\n", pa);
}

