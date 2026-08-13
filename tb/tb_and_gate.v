`timescale 1ns/1ps

module tb;

reg a,b;
wire y;

integer errors = 0;

and_gate dut(
    .a(a),
    .b(b),
    .y(y)
);

initial begin

    $dumpfile("wave.vcd");
    $dumpvars(0,tb);

    $display("================================");
    $display("AND Gate Verification Started");
    $display("================================");

    // Test 1
    a = 0; b = 0;
    #10;
    $display("a=%b b=%b y=%b expected=0",a,b,y);
    if(y !== 0) begin
        $display("FAIL : Test1");
        errors = errors + 1;
    end

    // Test 2
    a = 0; b = 1;
    #10;
    $display("a=%b b=%b y=%b expected=0",a,b,y);
    if(y !== 0) begin
        $display("FAIL : Test2");
        errors = errors + 1;
    end

    // Test 3
    a = 1; b = 0;
    #10;
    $display("a=%b b=%b y=%b expected=0",a,b,y);
    if(y !== 0) begin
        $display("FAIL : Test3");
        errors = errors + 1;
    end

    // Test 4
    a = 1; b = 1;
    #10;
    $display("a=%b b=%b y=%b expected=1",a,b,y);
    if(y !== 1) begin
        $display("FAIL : Test4");
        errors = errors + 1;
    end

    $display("--------------------------------");

    if(errors == 0) begin
        $display("PASS : ALL TEST CASES PASSED");
    end
    else begin
        $display("FAIL : %0d TEST CASE(S) FAILED",errors);
        $fatal;
    end

    $display("--------------------------------");

    $finish;

end

endmodule