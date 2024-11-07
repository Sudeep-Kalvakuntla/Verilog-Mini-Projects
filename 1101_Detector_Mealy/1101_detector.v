// Sequence detector for the overlapping sequence 1101 using a Mealy machine

module detector_1101 (
    input clk,
    input rst,
    input in,
    output reg out
);
  reg [1:0] current_state, next_state;

  parameter S0 = 2'b00;  // Initial state
  parameter S1 = 2'b01;  // After detecting 1
  parameter S2 = 2'b10;  // After detecting 11
  parameter S3 = 2'b11;  // After detecting 110

  always @(*) begin

    next_state = current_state;
    out = 0;

    case (current_state)
      S0: begin
        if (in) begin
          next_state = S1;
        end
      end
      S1: begin
        if (in) begin
          next_state = S2;
        end else begin
          next_state = S0;
        end
      end
      S2: begin
        if (!in) begin
          next_state = S3;
        end
      end
      S3: begin
        if (in) begin
          next_state = S1;
          out = 1;  // Sequence 1101 has been detected
        end else begin
          next_state = S0;
        end
      end
      default: next_state = S0;
    endcase


  end

  //Updating the state
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      current_state <= S0;
    end else begin
      current_state <= next_state;

    end

  end

endmodule
