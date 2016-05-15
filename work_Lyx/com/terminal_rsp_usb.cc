/******************************************************************************
 *  Copyright (c) 2014 Jinming Hu
 *  Distributed under the MIT license
 *  (See accompanying file LICENSE or copy at http://opensource.org/licenses/MIT)
 *
 *  Project: Cache Terminal
 *  Filename: chedan.cc
 *  Version: 1.0
 *  Author: Jinming Hu
 *  E-mail: hjm211324@gmail.com
 *  Date: Dec. 16, 2014
 *  Time: 19:03:47
 *  Description: compile with -lpthread to enable multithread
 *****************************************************************************/

#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <termios.h>
#include <signal.h>
#include <cstring>
#include <cstdint>
#include <iostream>
#include <thread>
#include <cstdint>
#include <string>
#include <CoreServices/CoreServices.h>
#include <mach/mach.h>
#include <mach/mach_time.h>
using namespace std;

// const int BAUD=230400; // self-OK
// const int BAUD=1228800; // self-Can't
// const int BAUD=460800; // self-OK
// const int BAUD=614400; // self-OK
// const int BAUD=921600; // self-half
const int BAUD=115200; // self-OK
const int TEST_ARG_A=131072;
const int TEST_ARG_B=8;

// block until receive a byte from serial port
uint8_t receive(const int com) {
	char buff[1];
	while (read(com, buff, 1) <= 0);
	return buff[0];
}

// send a byte to serial port
inline void send(const uint8_t x, const int com) {
	char buff[1];
	buff[0] = x;
	write(com, buff, 1);
}

static struct termios oldt;

void restore_terminal_settings() {
	tcsetattr(0, TCSANOW, &oldt);  /* Apply saved settings */
}

void restore(int) {
	// printf("restore\n");
	restore_terminal_settings();
	exit(0);
}


void disable_waiting_for_enter(void) {
	struct termios newt;

	/* Make terminal read 1 char at a time */
	tcgetattr(0, &oldt);  /* Save terminal settings */
	newt = oldt;  /* Init new settings */
	newt.c_lflag &= ~(ICANON | ECHO);  /* Change settings */
	tcsetattr(0, TCSANOW, &newt);  /* Apply settings */
	atexit(restore_terminal_settings); /* Make sure settings will be restored when program ends  */
}

int main(int argc,char** argv) {
	// if (argc != 2) {
	//     std::cout << "Usage: " << argv[0] << " <serial port>. " << std::endl;
	//     return 1;
	// }
	if (getuid()) {
		std::cout << "Need root privilage. " << std::endl;
		return 1;
	}

	int com;
	// if((com = open("/dev/cu.usbserial-FT98RO7G" , O_RDWR | O_NONBLOCK)) == -1){
	if((com = open("/dev/tty.usbserial" , O_RDWR | O_NONBLOCK)) == -1){
		std::cout << "Error while opening serial port. " << std::endl;
		return 2;
	}

	// serial port settings
	struct termios port_settings;
	memset(&port_settings, 0, sizeof(port_settings));
	port_settings.c_iflag = 0;
	port_settings.c_oflag = 0;
	port_settings.c_cflag = CS8 | CREAD | CLOCAL | CSTOPB;
	port_settings.c_lflag = 0;
	port_settings.c_cc[VMIN] = 1;
	port_settings.c_cc[VTIME] = 5;
	cfsetospeed(&port_settings, BAUD);
	cfsetispeed(&port_settings, BAUD);
	tcsetattr(com, TCSANOW, &port_settings);

	std::cout << "Prepared to send and receive... " << std::endl;

	auto send_command = [&com]() {
		disable_waiting_for_enter();
		signal(SIGINT, restore);

		for(;;){
			char buff = getchar();
			send(buff, com);
		}
	};

	auto recv_data = [&com]() {

		for(;;){
			char _a=receive(com) & 0xff;
			printf("%c",_a);
		}
	};

	std::thread send_thread(send_command);
	std::thread recv_thread(recv_data);

	send_thread.join();
	recv_thread.join();
	close(com);
	return 0;
}

