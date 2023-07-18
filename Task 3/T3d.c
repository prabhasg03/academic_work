//3d.)To Simulate the Round Robin CPU Scheduling algorithm.
#include<stdio.h>

int temp = 0;

struct roundrobin {
    char pname[10];
    int burst, time;
} p[10];

int main() {
    int i, n, full, q, wait[10], tat[10], time1 = 0;
    float avg = 0;

    printf("Enter the number of processes and timeslot: ");
    scanf("%d %d", &n, &q);

    for(i = 0; i < n; i++) {
        printf("\nEnter the process %d name and burst time: ", i + 1);
        scanf("%s %d", p[i].pname, &p[i].burst);
        p[i].time = p[i].burst;
    }

    full = n;

    while(full) {
        for(i = 0; i < n; i++) {
            if(p[i].burst >= q) {
                p[i].burst -= q;
                time1 += q;
            } else if(p[i].burst != 0) {
                time1 += p[i].burst;
                p[i].burst = 0;
            } else {
                continue;
            }

            if(p[i].burst == 0) {
                full--;
                tat[i] = time1;
            }
        }
    }

    for(i = 0; i < n; i++) {
        wait[i] = tat[i] - p[i].time;
    }

    printf("\nProcess  Turnaround Time  Waiting Time\n");
    for(i = 0; i < n; i++) {
        printf("%s\t\t%d\t\t%d\n", p[i].pname, tat[i], wait[i]);
        avg += tat[i];
    }

    avg /= n;

    printf("\nAverage turnaround time is %.2f\n", avg);

    return 0;
}
