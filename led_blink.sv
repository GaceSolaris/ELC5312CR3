`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Julieus Markle
// 
// Create Date: 10/15/2025 06:19:31 AM
// Design Name: 
// Module Name: led_blink
// Project Name: Blinking-LED core
// Target Devices: 
// Tool Versions: 
// Description: This module creates a state machine to define when to toggle the
//              the designated LED on or off. This is done on a set timer at a 
//              specific speed defined one level up in led_controller.sv
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


//Top component that defines the inputs and a single output
module led_blink (
    input logic clk,
    input logic rst,
    input logic blink_en,
    output logic led_state
    );
    //Similar to the timer, but flips the led state between on and off
    always_ff @(posedge(clk), posedge(rst)) begin
        if(rst)
            led_state <= 1'b0; 
        else if(blink_en)
            led_state <= ~led_state;
    end
    
endmodule

/*module led_blink(
    input logic clk,
    input logic rst,
    input logic [3:0] select_led,
    output logic [3:0] led_on
    );
    
    logic blink_en;
    logic [3:0] current_led;
    
    blink_timer #(.N(2)) define_speed(
        .clk(clk),
        .rst(rst),
        .en(blink_en)
        );
    
    always_ff @(posedge(clk), posedge(rst)) begin
        if(rst)
            current_led <= 4'b0000;
        else if(blink_en)
            current_led[0] <= ~select_led[0];
    end
    
    assign led_on = current_led;    
            
endmodule*/
