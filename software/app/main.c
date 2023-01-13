#include <stdio.h>
#include <unistd.h>
#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "sys/alt_irq.h"


int main()
{ 
  alt_putstr("Hello from Nios II!\n");
  int  inc=0;
  int aff;
  while (1){
	  // in this command we will transform a 3 digit int to a 12 bits BCD number
      aff = (inc % 10) | (((inc / 10) % 10) << 4) | ((inc /100) << 8);// same as aff=inc%10+((inc/10)%10)*16+(inc/100)*256; but better
	  IOWR_ALTERA_AVALON_PIO_DATA(AFFICHEUR_BASE,aff);
	  inc++;
	  if (inc==1000) {inc=0;} // to restart once it's over 999
	  usleep(90000);
  }

  return 0;
}
