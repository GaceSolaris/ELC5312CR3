`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Julieus Markle
// 
// Create Date: 10/16/2025 07:15:49 AM
// Design Name: 
// Module Name: blinking_led_wrapper
// Project Name: Blinking-LED core
// Target Devices: NEXYS4 DDR
// Tool Versions: Vivado 2024.1, Vitis 2024.1
// Description: This is the main wrapper that connects the general code to the 
//              NEXYS4 DDR board, linking the btn_r to the speed selection and
//              the discrete LEDs to LEDs 0 - 3 on the board. LEDs will be 
//              managed in an on-off state by switches.
// Dependencies: led_controller.sv, led_blink.sv, blink_timer.sv
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module blinking_led_wrapper(
    input logic clk,
    input logic rst,
    input logic [27:0] speed_sel,
    output logic [3:0] led
    );
    
    led_controller led_operation(
        .clk(clk),
        .rst(rst),
        .speed_sel(speed_sel),
        .led(led)
        );
endmodule
