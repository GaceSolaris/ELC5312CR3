/*****************************************************************//**
 * @file led_blink_core.cpp
 *
 * @brief implementation of various i/o related classes
 *
 * @author p chu
 * @version v1.0: initial release
 ********************************************************************/

#include "led_blink_core.h"

/**********************************************************************
 * LEDBlinkCore
 **********************************************************************/
LEDBlinkCore::LEDBlinkCore(uint32_t core_base_addr) {
   base_addr = core_base_addr;
   set_freq(1);
}

LEDBlinkCore::~LEDBlinkCore() {
}

void LEDBlinkCore::set_freq(int freq) {
   uint32_t dvsr;
   dvsr = (uint32_t) (SYS_CLK_FREQ * 1000000) / ((2 * freq) - 1);
   io_write(base_addr, MAX_COUNT_REG, dvsr);
}


