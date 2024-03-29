#include <ulib.h>
#include <file.h>
#include <stat.h>
#include <unistd.h>

#define BUFSIZE                         4096

int
cat(int fd) {
    static char buffer[BUFSIZE];
    int ret1, ret2;
    while ((ret1 = read(fd, buffer, sizeof(buffer))) > 0) {
        if ((ret2 = write(1, buffer, ret1)) != ret1) {
            return ret2;
        }
    }
    return ret1;
}

int
main(int argc, char **argv) {
    if (argc == 1) {
        return cat(0);
    }
    else {
        int i, ret, fd;
        for (i = 1; i < argc; i ++) {
            if ((fd = open(argv[i], O_RDONLY)) < 0) {
                return fd;
            }
            if ((ret = cat(fd)) != 0) {
                return ret;
            }
            close(fd);
        }
    }
    return 0;
}
