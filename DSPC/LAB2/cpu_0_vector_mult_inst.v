// cpu_0_vector_mult_inst.v

// Generated using ACDS version 12.1 177 at 2013.02.13.11:49:12

`timescale 1 ps / 1 ps
module cpu_0_vector_mult_inst (
		input  wire [31:0] dataa,  // nios_custom_instruction_slave_0.dataa
		input  wire [31:0] datab,  //                                .datab
		output wire [31:0] result  //                                .result
	);

	vector_mult cpu_0_vector_mult_inst_inst (
		.dataa  (dataa),  // nios_custom_instruction_slave_0.dataa
		.datab  (datab),  //                                .datab
		.result (result)  //                                .result
	);

endmodule
