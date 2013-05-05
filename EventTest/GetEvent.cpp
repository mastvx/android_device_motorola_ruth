#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>
#include <linux/input.h>

#define KeypadFILE "/dev/input/event4"


int main()
{
	int fd;
	struct input_event ie;
	
	if((fd = open(KeypadFILE, O_RDONLY)) == -1) {
	    perror("opening device");
	    exit(EXIT_FAILURE);
	}
	
	read(fd, &ie, sizeof(struct input_event));
	printf("%d ", ie.value);
	
	return 0;
}