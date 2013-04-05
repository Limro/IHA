// iis2st_0.v

// Generated using ACDS version 12.1 177 at 2013.03.25.15:43:48

`timescale 1 ps / 1 ps
module iis2st_0 (
		input  wire        reset_n,          //                   reset.reset_n
		input  wire [23:0] ast_sink_data,    //   avalon_streaming_sink.data
		output wire        ast_sink_ready,   //                        .ready
		input  wire        ast_sink_valid,   //                        .valid
		input  wire [1:0]  ast_sink_error,   //                        .error
		output wire [23:0] ast_source_data,  // avalon_streaming_source.data
		input  wire        ast_source_ready, //                        .ready
		output wire        ast_source_valid, //                        .valid
		output wire [1:0]  ast_source_error, //                        .error
		input  wire        ast_clk,          //               clock_48K.clk
		input  wire        clk,              //               clock_12M.clk
		input  wire        bitclk,           //             conduit_end.export
		input  wire        adcdat,           //                        .export
		output wire        dacdat,           //                        .export
		input  wire        adclrck,          //                        .export
		input  wire        daclrck           //                        .export
	);

	iis2st iis2st_0_inst (
		.reset_n          (reset_n),          //                   reset.reset_n
		.ast_sink_data    (ast_sink_data),    //   avalon_streaming_sink.data
		.ast_sink_ready   (ast_sink_ready),   //                        .ready
		.ast_sink_valid   (ast_sink_valid),   //                        .valid
		.ast_sink_error   (ast_sink_error),   //                        .error
		.ast_source_data  (ast_source_data),  // avalon_streaming_source.data
		.ast_source_ready (ast_source_ready), //                        .ready
		.ast_source_valid (ast_source_valid), //                        .valid
		.ast_source_error (ast_source_error), //                        .error
		.ast_clk          (ast_clk),          //               clock_48K.clk
		.clk              (clk),              //               clock_12M.clk
		.bitclk           (bitclk),           //             conduit_end.export
		.adcdat           (adcdat),           //                        .export
		.dacdat           (dacdat),           //                        .export
		.adclrck          (adclrck),          //                        .export
		.daclrck          (daclrck)           //                        .export
	);

endmodule
