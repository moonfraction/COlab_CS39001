module ariShift(
  input [31:0] a,
  input [31:0] b,
  output [31:0] ans
);
wire t0;
wire [31:0] s;
wire [31:0] msb = {a[31], a[31], a[31], a[31], a[31], a[31], a[31],a[31], a[31], a[31], a[31], a[31], a[31], a[31],a[31], a[31], a[31], a[31], a[31], a[31], a[31],a[31], a[31], a[31], a[31], a[31], a[31], a[31],a[31], a[31], a[31], a[31]};


  wire [31:0]ax[0:31];
  assign ax[0] = a;
  generate
    genvar i;
    for (i = 1; i < 32; i = i + 1) begin: axi
      assign ax[i] = {msb[31:32-i], a[31:i]};
    end
  endgenerate

  generate
    genvar j;
    for (j = 0; j < 32; j = j + 1) begin: mux321
      mux321 m (.a(ax[j]), .sel(b[4:0]), .b(s[j]));
    end
  endgenerate
  
  or or0 (t0, b[5], b[6], b[7], b[8], b[9], b[10], b[11], b[12], b[13], b[14], b[15], b[16], b[17], b[18], b[19], b[20], b[21], b[22], b[23], b[24], b[25], b[26], b[27], b[28], b[29], b[30], b[31]);

  generate
    genvar k;
    for (k = 0; k < 32; k = k + 1) begin: mux21
      mux21 n (.a({a[31], s[k]}), .sel(t0), .b(ans[k]));
    end
  endgenerate



endmodule

