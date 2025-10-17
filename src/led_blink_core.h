/*****************************************************************//**
 * @file led_blink_core.h
 *
 * @brief Contain classes of simple i/o related cores
 *
 * Detailed description:
 *
 * @author p chu
 * @version v1.0: initial release
 ********************************************************************/

#ifndef _LED_BLINK_H_INCLUDED
#define _LED_BLINK_H_INCLUDED

#include "chu_init.h"

/**********************************************************************
 * LED Blink core driver
 **********************************************************************/
/**
 *
 */
class LEDBlinkCore {
public:
   /**
    * register map
    *
    */
   enum {
      MAX_COUNT_REG = 0,         /**< Blink Rate register */
   };
   /**
    * constructor.
    * @note default pwm frequency is set to 1K Hz
    * @note all pwm channels have the same frequency
    *
    */
   LEDBlinkCore(uint32_t core_base_addr);
   ~LEDBlinkCore();

   /* methods */
   /**
    * set pwm switching frequency
    *
    * @param freq pwm switching frequency
    *
    */
   void set_freq(int freq);

private:
   uint32_t base_addr;
   uint32_t freq;
};


#endif  // _LED_BLINK_H_INCLUDED
