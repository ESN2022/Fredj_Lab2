#include <stdio.h>
#include <unistd.h>
#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "sys/alt_irq.h"

int main()
{ 
  alt_putstr("Hello from Nios II!\n");
  int inc=0x00;
  /* Event loop never exits. */
  while (1){
	  IOWR_ALTERA_AVALON_PIO_DATA(AFFICHEUR_BASE,inc);
	  inc++;
	  if (inc==0x09) inc=0x00;
	  usleep(1000000);
  }

  return 0;
}
