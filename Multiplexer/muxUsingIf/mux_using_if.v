//-----------------------------------------------------
// Design Name : mux_using_if
// File Name   : mux_using_if.v
// Function    : 2:1 Mux using If
// Coder       : Deepak Kumar Tala
//-----------------------------------------------------
module  mux_using_if(
din_0      , // Mux first input
din_1      , // Mux Second input
sel        , // Select input
mux_out      // Mux output
);
//-----------Input Ports---------------
input din_0, din_1, sel ;
//-----------Output Ports---------------
output mux_out;
//------------Internal Variables--------
reg  mux_out;  // Mux çıkışını tutacak bir 'reg' türünde değişken

//-------------Code Starts Here---------
always @ (sel or din_0 or din_1)
begin : MUX
  // Seçim sinyaline göre girişlerden birini çıkışa atama
  if (sel == 1'b0) begin
      mux_out = din_0;  // Eğer 'sel' 0 ise, 'din_0' çıkışa verilir
  end else begin
      mux_out = din_1 ; // Eğer 'sel' 1 ise, 'din_1' çıkışa verilir
  end
end

endmodule //End Of Module mux

