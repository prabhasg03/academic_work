#include <stdio.h>
#include <pthread.h>
#include <semaphore.h>

sem_t mutex, writeblock;
int data = 0, rcount = 0;

void *reader(void *arg) {
    int f = *((int *)arg);
    sem_wait(&mutex);
    rcount++;
    if (rcount == 1) {
        sem_wait(&writeblock);
    }
    sem_post(&mutex);

    printf("Data read by reader %d is %d\n", f, data);

    sem_wait(&mutex);
    rcount--;
    if (rcount == 0) {
        sem_post(&writeblock);
    }
    sem_post(&mutex);
    pthread_exit(NULL);
}

void *writer(void *arg) {
    int f = *((int *)arg);
    sem_wait(&writeblock);
    data++;
    printf("Data written by writer %d is %d\n", f, data);
    sem_post(&writeblock);
    pthread_exit(NULL);
}

int main() {
    int i;
    pthread_t rtid[4], wtid[4];
    int reader_args[4], writer_args[4];

    sem_init(&mutex, 0, 1);
    sem_init(&writeblock, 0, 1);

    for (i = 0; i < 4; i++) {
        reader_args[i] = i;
        writer_args[i] = i;
        pthread_create(&rtid[i], NULL, reader, &reader_args[i]);
        pthread_create(&wtid[i], NULL, writer, &writer_args[i]);
    }

    for (i = 0; i < 4; i++) {
        pthread_join(rtid[i], NULL);
        pthread_join(wtid[i], NULL);
    }

    sem_destroy(&mutex);
    sem_destroy(&writeblock);

    return 0;
}
