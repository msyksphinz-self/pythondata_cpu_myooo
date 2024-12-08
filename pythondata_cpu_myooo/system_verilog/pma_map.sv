module pma_map
  import myooo_lsu_pkg::*;
(
  input logic [riscv_pkg::PADDR_W-1: 0] i_pa,
  output logic o_map_hit,
  output map_attr_t o_map_attr
);


localparam MAP_TABLE_SIZE = 6;
/* verilator lint_off UNOPTFLAT */
logic [MAP_TABLE_SIZE-1: 0] w_hit_addr;
map_attr_t w_map_attr[MAP_TABLE_SIZE];
/* verilator lint_off UNSIGNED */
assign w_hit_addr[ 0] = (i_pa >= 56'h00000000000000) & (i_pa < 56'h00000000020000);  // Address Region : 0 - 1ffff
assign w_map_attr[ 0].r = 1'b1;
assign w_map_attr[ 0].w = 1'b0;
assign w_map_attr[ 0].x = 1'b1;
assign w_map_attr[ 0].a = 1'b1;
assign w_map_attr[ 0].c = 1'b0;
assign w_hit_addr[ 1] = (i_pa >= 56'h000000f0000000) & (i_pa < 56'h000000f0010000);  // Address Region : f0000000 - f000ffff
assign w_map_attr[ 1].r = 1'b1;
assign w_map_attr[ 1].w = 1'b1;
assign w_map_attr[ 1].x = 1'b0;
assign w_map_attr[ 1].a = 1'b1;
assign w_map_attr[ 1].c = 1'b0;
assign w_hit_addr[ 2] = (i_pa >= 56'h000000f0010000) & (i_pa < 56'h000000f0020000);  // Address Region : f0010000 - f001ffff
assign w_map_attr[ 2].r = 1'b1;
assign w_map_attr[ 2].w = 1'b1;
assign w_map_attr[ 2].x = 1'b0;
assign w_map_attr[ 2].a = 1'b1;
assign w_map_attr[ 2].c = 1'b0;
assign w_hit_addr[ 3] = (i_pa >= 56'h000000f0c00000) & (i_pa < 56'h000000f1000000);  // Address Region : f0c00000 - f0ffffff
assign w_map_attr[ 3].r = 1'b1;
assign w_map_attr[ 3].w = 1'b1;
assign w_map_attr[ 3].x = 1'b0;
assign w_map_attr[ 3].a = 1'b1;
assign w_map_attr[ 3].c = 1'b0;
assign w_hit_addr[ 4] = (i_pa >= 56'h00000010000000) & (i_pa < 56'h00000010002000);  // Address Region : 10000000 - 10001fff
assign w_map_attr[ 4].r = 1'b1;
assign w_map_attr[ 4].w = 1'b1;
assign w_map_attr[ 4].x = 1'b1;
assign w_map_attr[ 4].a = 1'b1;
assign w_map_attr[ 4].c = 1'b1;
assign w_hit_addr[ 5] = (i_pa >= 56'h00000040000000) & (i_pa < 56'h00000040f00000);  // Address Region : 40000000 - 40efffff
assign w_map_attr[ 5].r = 1'b1;
assign w_map_attr[ 5].w = 1'b1;
assign w_map_attr[ 5].x = 1'b1;
assign w_map_attr[ 5].a = 1'b1;
assign w_map_attr[ 5].c = 1'b1;


assign o_map_hit = |w_hit_addr;
always_comb begin
case (w_hit_addr)
  6'b000001 : o_map_attr = w_map_attr[0];
  6'b000010 : o_map_attr = w_map_attr[1];
  6'b000100 : o_map_attr = w_map_attr[2];
  6'b001000 : o_map_attr = w_map_attr[3];
  6'b010000 : o_map_attr = w_map_attr[4];
  6'b100000 : o_map_attr = w_map_attr[5];
  default   : o_map_attr = 'h0;
endcase
end

endmodule
