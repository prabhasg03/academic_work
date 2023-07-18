//3a.) To Simulate the First Come First Served CPU Scheduling algorithm.
//Program:
#include<stdio.h>

struct sa {
    char pro[10];
    int bt, wt, tat, prior;
} p[10], temp;

int main() {
    int i, j, n, temp1 = 0;
    float awt = 0, atat = 0;

    printf("\nEnter the number of processes: ");
    scanf("%d", &n);

    printf("\nEnter the details of processes (process, burst time):\n");
    for(i = 0; i < n; i++) {
        scanf("%s %d", p[i].pro, &p[i].bt);
    }

    for(i = 0; i < n; i++) {
        p[i].wt = temp1;
        p[i].tat = p[i].bt + p[i].wt;
        temp1 += p[i].bt;
    }

    printf("\nProcess\tBurst Time\tWaiting Time\tTurnaround Time\n");
    for(i = 0; i < n; i++) {
        printf("%s\t%d\t\t%d\t\t%d\n", p[i].pro, p[i].bt, p[i].wt, p[i].tat);
        awt += p[i].wt;
        atat += p[i].tat;
    }

    awt /= n;
    atat /= n;

    printf("\nAverage Waiting Time: %.2f\n", awt);
    printf("Average Turnaround Time: %.2f\n", atat);

    return 0;
}
