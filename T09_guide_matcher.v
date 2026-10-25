module T09_guide_matcher(input [15:0] guide, window,
input [1:0] threshold, output reg [3:0] mismatch_count,
output reg match);
parameter A=2'b00, C=2'b01, G=2'b10, T=2'b11;
integer i;
reg match1;
always @(*) begin
    mismatch_count=0;
    for(i=0;i<8;i=i+1) begin
match1=guide[i*2+:2]&window[i*2+:2];
if(~match1)
mismatch_count=mismatch_count+1'b1;
case(threshold)
2'b00: match=(mismatch_count<=0)?1:0;
2'b01: match=(mismatch_count<=1)?1:0;
2'b10: match=(mismatch_count<=2'b10)?1:0;
default match=0;
endcase
    end
    end

endmodule


module T09_genome_window_generator(input clk, rst, fragment_valid,
input [15:0] fragment,
output [15:0] window,
output window_valid);

endmodule

module T09_target_locator(input clk, rst, start,
input [63:0] genome,
input [15:0] guide,
input [1:0] threshold,
output target_found, done,
output [3:0] mismatch_count,
output [4:0] target_position);

reg match2;

genvar i;
generate
for(i=63;i>15; i=i-2) begin: uut
    T09_guide_matcher in1(guide,genome[i:i-15],threshold,mismatch_count,match2);
	 if(match2 == 1)
		assign target_position = i;
end
endgenerate
	 
endmodule
















module T09_genome_editor(input clk,rst,edit_request,
input [63:0] genome_in,
input [4:0] edit_position,
input [7:0] replacement,
output edit_success,done,
output [63:0] genome_out);

endmodule
module T09_edit_verifier(input clk,rst, verify_request,
input [63:0] genome_original,genome_edited,
input [4:0] edit_position,
input [7:0] replacement,
output verify_pass,done,
output [5:0] mismatch_count
);
endmodule