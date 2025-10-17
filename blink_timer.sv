`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Julieus Markle
// 
// Create Date: 10/15/2025 06:22:17 AM
// Design Name: 
// Module Name: blink_timer
// Project Name: Blinking-LED core
// Target Devices: NEXYS4 DDR
// Tool Versions: 
// Description: This module defines the timer to set the blinking speed for each
//              LED.
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

//Top portion that defines the necessary inputs and single output
//Parameter holds as a placeholder to define the speed of the timer
module blink_timer #(parameter N = 27)(
    input logic clk,
    input logic rst,
    input [N-1:0] max_count,
    output logic en
    );
    //Internal wire that holds the counting value
    logic [N-1:0] blink_speed;
    //Reset to reset the counter
    //Timer will count to max size continuously, and rolls back over once it hits 
    //the max bit value
    always_ff @(posedge(clk), posedge(rst)) begin
        if(rst)
            blink_speed <= 0;
        else
            blink_speed <= blink_speed +1;
    end
    //designates when a signal should be sent out at the max bit number
    assign en = (blink_speed==max_count) ? 1'b1: 1'b0;
endmodule
