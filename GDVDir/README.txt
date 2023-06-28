Command to just create the obligation .p files ...
GDV -g -K TestFiles/LampdaPiTests/GEO173+2 -l -i LampdaPiTests/GEO173+2/GEO173+2.p TestFiles/LampdaPiTests/GEO173+2/E---3_0_THM-CRf_s

Command to also verify using ZenonModuloLP, which requires a full SystemOnTPTP installation
GDV -f -t 60 -p ZenonModuloLP---0.4.2 -K LampdaPiTests/GEO173+2 -l -i TestFiles/LampdaPiTests/GEO173+2/GEO173+2.p TestFiles/LampdaPiTests/GEO173+2/E---3_0_THM-CRf_s

Command to understand the flags
GDV -h

Note that the -K flag requires a path starting above the example directory, e.g., here the example 
directory is GEO173+2, and you to start from your LampdaPi project directory, e.g., here I use
LampdaPiTests.
