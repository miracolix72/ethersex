/**********************************************************
* driver for MCA-25 camera
* @Author: Simon Schulz [avr<AT>auctionant.de]
*
* CHANGES:
* --------
* (Ingo Busker http://www.mikrocontroller.com):
*  - new portpin mapping for LEDs, if ISA_CTRL is defined (in main.h)
*  - you can disable LEDs
* 
***********************************************************/
#ifndef _MCA25_H_
	#define _MCA25_H_

  #define CAM_BUFFER_LEN 512
	
	//enable cam plugin:
	#define USE_MCA25_CAM 1
	
	#define MCA25_COMM_BUFFER_LEN 40
	#define MCA25_NOT_BUSY 255
	#define MCA25_STILL_BUSY 254
	#define MCA25_FIRST_DATA 0
	#define MCA25_NEXT_DATA 1
	#define MCA25_SKIP_PICTURE 99
	#define MCA25_BUSY_ABORTED 111
	
	//reset control signal
	#define MCA25_RESET_HI() PIN_SET(MCA25_RESET);
	#define MCA25_RESET_LO() PIN_CLEAR(MCA25_RESET);
	
	//DISABLE LED MACROS
	//status led
	#define MCA25_STATUS_LED_OFF() nop();
        #define MCA25_STATUS_LED_ON()  nop();

	//error led on pin b2
	#define MCA25_ERROR_LED_OFF() nop();
        #define MCA25_ERROR_LED_ON()  nop();
	
	//clock led on pin b4
	#define MCA25_CLOCK_LED_OFF() nop();
        #define MCA25_CLOCK_LED_ON()  nop();
	
	#include <avr/pgmspace.h>
	extern PROGMEM char MCA25_START_JPG[];
	extern PROGMEM char MCA25_CONFIG_640x480[];
	extern PROGMEM char MCA25_START_CAPTURING_1[];
	extern PROGMEM char MCA25_START_CAPTURING_2[];
	extern PROGMEM char MCA25_START_CAPTURING_3[];
	
	extern volatile unsigned char mca25_uart_disabled;
	extern unsigned char mca25_cam_busy_for_socket;
	extern unsigned char mca25_cam_status;
	extern volatile unsigned char mca25_cam_active;

	// functions:
	extern unsigned char mca25_copy_image_data_to_tcp_buffer(char *buffer, int *bufferlen);
	extern void mca25_grab_data(char *buffer, unsigned int *datalen, unsigned char *frametype);
	extern void mca25_grab_jpeg(void);
	extern void mca25_start_image_grab(void);
	extern void mca25_configure(void);
	extern void mca25_init(void);
	extern void mca25_process(void);
	extern void mca25_reset_cam(void);

	extern void mca25_check_for_closed_tcpconn(void);
	
	extern void mca25_send_data_ack(void);
	extern void mca25_read_at_command(unsigned char *buffer);
	extern void mca25_read_mux_packet(unsigned char *buffer);
	extern void mca25_send_ok(void);
	extern void mca25_pgm_send(PGM_P);

	//helper:
	//extern int memcmp_P(unsigned char *buf, PGM_P pointer, unsigned int len);

#include "config.h"
#ifdef DEBUG_MCA25
# include "core/debug.h"
# define MCA25_DEBUG(a...)  debug_printf("mca25: " a)
#else
# define MCA25_DEBUG(a...)
#endif
	
#endif