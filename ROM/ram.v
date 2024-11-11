module ram #(
    parameter Width = 8,
    Depth = 16
) (
    input clk,
    input wrEn,  // Let's you write memory when it is high
    input [$clog2(Depth) - 1:0] wrAddr,  // Address for writing
    input [Width-1:0] wrData,  // Data to be written
    input [$clog2(Depth) - 1:0] rdAddr,
    output reg [Width-1:0] rdData
);

  reg [Width-1:0] mem[Depth-1:0];

  //Writing to memory logic

  always @(posedge clk) begin

    if (wrEn) begin
      mem[wrAddr] <= wrData;
    end
  end

  // Read logic

  always @(posedge clk) begin

    rdData <= mem[rdAddr];

  end

endmodule
