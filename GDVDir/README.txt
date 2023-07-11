Command to create LambdaPi files and just create the obligation .p files ...
GDV -g -K TestsForLambdaPi/GEO173+2 -l -i TestsForLambdaPi/GEO173+2/GEO173+2.p TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s

Command to also verify using ZenonModuloLP, which requires a full 
SystemOnTPTP installation
GDV -f -t 60 -p ZenonModuloLP---0.4.2 -K TestsForLambdaPi/GEO173+2 -l -i TestsForLambdaPi/GEO173+2/GEO173+2.p TestsForLambdaPi/GEO173+2/E---3_0_THM-CRf_s

Command to understand the flags
GDV -h

Note that the -K flag requires a path starting from your LambdaPi directory somwhere above the 
example directory, e.g., here the example directory is GEO173+2, and I start from TestsForLambdaPi.
