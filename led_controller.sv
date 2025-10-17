`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Julieus Markle
// 
// Create Date: 10/15/2025 10:01:47 PM
// Design Name: 
// Module Name: led_controller
// Project Name: Blinking-LED core
// Target Devices: NEXYS4 DDR
// Tool Versions: 
// Description: This controller manages the internal logic for LED states and 
//              Blinking speeds.
// Dependencies: led_blink.sv, blink_timer.sv
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

//Main inputs and desired project output of 4 Discrete LEDs
module led_controller #(parameter N = 27)(
    input logic clk,
    input logic rst,
    input logic [N-1:0] speed_sel,
    output logic [3:0] led
    );
    
    //Internal logic wires to define proper speeds for the LEDs
    logic en_slowest, en_slow, en_fast, en_fastest;
    
    //All LEDs will blink at the same speed. Project guidelines did not define specifics
    //for individual or all at once
    logic final_blink_en; 

    blink_timer #(.N(N)) speed_timer(
        .clk(clk),
        .rst(rst),
        .max_count(speed_sel),
        .en(final_blink_en)
        );
    
    //Defines each discrete LED for control. All blink at the same rate driven by
    //final_blink_en signal
    // LED 0
    led_blink led0 (
        .clk(clk), 
        .rst(rst), 
        .blink_en(final_blink_en), 
        .led_state(led[0])
        );
    // LED 1
    led_blink led1 (
        .clk(clk), 
        .rst(rst), 
        .blink_en(final_blink_en), 
        .led_state(led[1])
        );
    // LED 2
    led_blink led2 (
        .clk(clk), 
        .rst(rst), 
        .blink_en(final_blink_en), 
        .led_state(led[2])
        );
    // LED 3
    led_blink led3 (
        .clk(clk), 
        .rst(rst), 
        .blink_en(final_blink_en), 
        .led_state(led[3])
        );
    
endmodule
