#include<stdio.h>
#include<stdlib.h>
#include<pthread.h>
#include<semaphore.h>
#include<unistd.h>
#define N 5
#define THINKING 0
#define HUNGRY 1
#define EATING 2
#define LEFT (ph_num+4)%N
#define RIGHT (ph_num+1)%N
sem_t mutex;
sem_t s[N];
int state[N]={THINKING,THINKING,THINKING,THINKING,THINKING};
int phil_num[N]={0,1,2,};
void *philosopher(void *num);
void take_fork(int ph_num);
void put_fork(int ph_num);
void test(int ph_num);
int main(){
    int i;
    pthread_t thread_id[N];
    sem_init(&mutex,0,1);
    for(i=0;i<N;i++){
        sem_init(&s[i],0,0);
    }
        for(i=0;i<N;i++){
        pthread_create(&thread_id[i],NULL,philosopher,&phil_num[i]);
        printf("philosopher %d is thinking\n",i+1);
    }
        for(i=0;i<N;i++){
        pthread_join(thread_id[i],NULL);
    }
    sem_destroy(&mutex);
            for(i=0;i<N;i++){
        sem_destroy(&s[i]);
    }
    return 0;
}
void *philosopher(void *num){
    while(1){
        int *i=num;
        sleep(1);
        take_fork(*i);
        sleep(1);
        put_fork(*i);
    }
}
void take_fork(int ph_num){
    sem_wait(&mutex);
    state[ph_num]=HUNGRY;
    printf("philosopher %d is hungry\n",ph_num+1);
    test(ph_num);
    sem_post(&mutex);
    sem_wait(&s[ph_num]);
    sleep(1);
}
void test(int ph_num){
    if(state[ph_num]==HUNGRY&&state[LEFT]!=EATING&&state[RIGHT]!=EATING){
        state[ph_num]=EATING;
        printf("philosopher %d takes fork %d and %d\n",ph_num+1,LEFT+1,ph_num+1);
        printf("philosopher %d is eating\n",ph_num+1);
        sem_post(&s[ph_num]);
    }
}
void put_fork(int ph_num){
    sem_wait(&mutex);
    state[ph_num]=THINKING;
    printf("philosopher %d putting fork %d and %d down\n",ph_num+1,LEFT+1,ph_num+1);
    printf("philosopher %d is thinking\n",ph_num+1);
    test(LEFT);
    test(RIGHT);
    sem_post(&mutex);
}