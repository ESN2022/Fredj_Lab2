#include <stdio.h>
#include <unistd.h>
#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "sys/alt_irq.h"
#include "altera_avalon_timer_regs.h"


  volatile int  inc=0; // since it changes with every interruption
  int aff=0;
static void irqhandler_TIMER_0(void* context,alt_u32 id){
	//this commande will convert a 3 digit int into a 12 bits BCD
	aff = (inc % 10) | (((inc / 10) % 10) << 4) | ((inc /100) << 8); // same as aff=inc%10+((inc/10)%10)*16+(inc/100)*256; but better
	IOWR_ALTERA_AVALON_PIO_DATA(AFFICHEUR_BASE,aff);
	inc=inc+1;
	if (inc==1000) { inc=0;} // counter restore when it's over 999

	IOWR_ALTERA_AVALON_TIMER_STATUS(TIMER_0_BASE, 0); // clear the reset
}


int main()
{ 
	alt_ic_isr_register(TIMER_0_IRQ_INTERRUPT_CONTROLLER_ID,TIMER_0_IRQ, (void*)irqhandler_TIMER_0, NULL, 0);
    IOWR_ALTERA_AVALON_TIMER_CONTROL(TIMER_0_BASE, 0x07); //ALTERA_AVALON_TIMER_CONTROL_ITO_MSK (0x01)+ALTERA_AVALON_TIMER_CONTROL_CONT_MSK (0x02)+ALTERA_AVALON_TIMER_CONTROL_START_MSK (0x04)
  while (1){ }

  return 0;
}
