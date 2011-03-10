dnl
dnl generic-usb-teensy.m4.m4
dnl
dnl Pin Configuration for 'generic-usb-teensy.m4'.  Edit it to fit your needs.
dnl

ifdef(`conf_USB', `
  dnl This must also be D+ of the USB signal
  USB_USE_INT(1)
  dnl This pin must have the 1k5 Pullup and must be on the same port as the Interupt pin
  pin(USB_DMINUS, PD5)
  pin(USB_DPLUS, PD3)
')

ifdef(`conf_STATUSLED_POWER', `dnl
pin(STATUSLED_POWER, PA3, OUTPUT)
')dnl

ifdef(`conf_STATUSLED_BOOTED', `dnl
pin(STATUSLED_BOOTED, PA3, OUTPUT)
')dnl

ifdef(`conf_STATUSLED_NETLINK', `dnl
pin(STATUSLED_NETLINK, PA2, OUTPUT)
')dnl

ifdef(`conf_STATUSLED_TX', `dnl
pin(STATUSLED_TX, PD6, OUTPUT)
')dnl

ifdef(`conf_STATUSLED_RX', `dnl
pin(STATUSLED_RX, PD7, OUTPUT)
')dnl

ifdef(`conf_RFM12', `
  /* port the rfm12 module CS is attached to */
  pin(SPI_CS_RFM12, SPI_CS_HARDWARE)
  /* port the LEDS for rfm12 txrx attached to */
  ifdef(`conf_STATUSLED_TX', `pin(RFM12_TX_PIN, STATUSLED_TX)')
  ifdef(`cong_STATUSLED_RX', `pin(RFM12_RX_PIN, STATUSLED_RX)')

  RFM12_USE_INT(0)
')

ifdef(`conf_ZBUS', `dnl
  /* port config for zbus */
  pin(ZBUS_RXTX_PIN, PD2)
  pin(ZBUS_TX_PIN, STATUSLED_TX)
  pin(ZBUS_RX_PIN, STATUSLED_RX)
')

ifdef(`conf_HD44780', `dnl
  pin(HD44780_RS, PD0)
  pin(HD44780_EN1, PD1)
  pin(HD44780_D4, PD4)
  pin(HD44780_D5, PD5)
  pin(HD44780_D6, PD6)
  pin(HD44780_D7, PD7)
')
