module chu_gpo
   #(parameter W = 4)  // width of output port
   (
    input  logic clk,
    input  logic reset,
    // slot interface
    input  logic cs,
    input  logic read,
    input  logic write,
    input  logic [4:0] addr,
    input  logic [31:0] wr_data,
    output logic [31:0] rd_data,
    // external port    
    output logic [W-1:0] dout
   );

   // declaration
   logic [W-1:0] buf_reg;
   logic wr_en;

   logic [3:0] led_send;

   // body
   // output buffer register
   always_ff @(posedge clk, posedge reset)
      if (reset)
         buf_reg <= 0;
      else   
         if (wr_en)
            buf_reg <= wr_data[W-1:0];
   // decoding logic 
   assign wr_en = cs && write;
   
   led_controller #(.N(27)) led_core(
        .clk(clk),
        .rst(reset),
        .speed_sel(buf_reg),
        .led(led_send)
    );
   
   // slot read interface
   assign rd_data =  0;
   // external output  
   assign dout = led_send;
endmodule
       



