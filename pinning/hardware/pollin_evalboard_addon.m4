dnl
dnl pollin_evalboard.m4
dnl
dnl Pin Configuration for 'pollin_evalboard'.  Edit it to fit your needs.
dnl

ifdef(`conf_HD44780', `dnl
pin(HD44780_RS, PB2)
pin(HD44780_RW, PB1)
pin(HD44780_D4, PA4)
pin(HD44780_D5, PA5)
pin(HD44780_D6, PA6)
pin(HD44780_D7, PA7)
pin(HD44780_EN1, PB0)
')dnl

ifdef(`conf_STATUSLED_TX', `dnl
pin(STATUSLED_TX, PC2, OUTPUT)
')dnl

ifdef(`conf_STATUSLED_RX', `dnl
pin(STATUSLED_RX, PC3, OUTPUT)
')dnl

ifdef(`conf_RFM12', `dnl
/* port the rfm12 module CS is attached to */
dnl pin(SPI_CS_RFM12, SPI_CS_HARDWARE)
pin(SPI_CS_RFM12, PC0, OUTPUT)
RFM12_USE_INT(0)
RFM12_ASK_SENSE_USE_INT(1)
dnl pin(RFM12_TX_PIN, PD5, OUTPUT)
dnl pin(RFM12_RX_PIN, PD6, OUTPUT)
')

ifdef(`conf_FS20', `dnl
/* fs20 support */
pin(FS20_SEND, PD3)
ifdef(`conf_FS20_RECEIVE', `dnl
/* DO NOT CHANGE PIN!  USES INTERNAL COMPARATOR! */
pin(FS20_RECV, PB3)
')dnl
')dnl


ifdef(`conf_RC5', `
  pin(RC5_SEND, PD4)
  RC5_USE_INT(0)
')

ifdef(`conf_IRMP', `dnl
  pin(IRMP_RX, PD3)
#undef IRMP_USE_TIMER2
#define IRMP_RX_LOW_ACTIVE
#undef IRMP_RX_LED_LOW_ACTIVE 
  pin(IRMP_TX, PD7) dnl OC2/OC2A
#undef IRMP_TX_LED_LOW_ACTIVE 
')

dnl pin(KEY1, PD2)
dnl pin(KEY2, PD3)
dnl pin(KEY3, PD4)
dnl pin(LED1, PD5)
dnl pin(LED2, PD6)
dnl pin(SPEAKER, PD7)

