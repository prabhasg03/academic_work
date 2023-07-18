/*Write a program that makes a copy of a file using standard I/O and system calls*/
//Program
#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

#define BUFFER_SIZE 1024

int main() {
    int fd1, fd2, n;
    char buf[BUFFER_SIZE];

    fd1 = open("f1", O_RDONLY);
    fd2 = open("f2", O_WRONLY | O_CREAT, S_IRUSR | S_IWUSR);

    if (fd1 == -1 || fd2 == -1) {
        printf("Error opening files.\n");
        return 1;
    }

    while ((n = read(fd1, buf, BUFFER_SIZE)) > 0) {
        write(fd2, buf, n);
    }

    close(fd1);
    close(fd2);

    return 0;
}
