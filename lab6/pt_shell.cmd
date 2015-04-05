#@ # 
#@ # Running pt_shell Version X-2005.06 for linux -- May 19, 2005
#@ # Date:   Sun Apr  5 16:57:18 2015
#@ # Run by: garland1@ug179.eecg
#@ 

source /CMC/tools/synopsys/syn2005/pt_X-2005.06/admin/setup/.synopsys_pt.setup
#@ #
#@ # .synopsys_pt.setup: Initialization File for PrimeTime
#@ #
#@ 
#@ 
#@ #
#@ # Enable stack trace output on fatal.  Not available for all architectures.
#@ #
#@ if { $sh_arch == "sparcOS5" || $sh_arch == "hpux10" ||      $sh_arch == "hp32" || $sh_arch == "linux" } {
#@   set_unix_variable SYNOPSYS_TRACE ""
#@ }
#@ 
#@ #
#@ # Variable settings
#@ #
#@ 
#@ #
#@ # Synopsys strongly recommends that you use new variable message
#@ # tracing for debugging purposes only.
#@ #
#@ set sh_new_variable_message true
#@ 
#@ #
#@ # Synopsys strongly recommends that you uncomment the following command
#@ # in order to set sh_command_abbrev_mode to the value "Command-Line-Only".
#@ # Command abbreviation is intended as an interactive convenience.  Using
#@ # abbreviations in scripts can cause commands to fail in subsequent releases.
#@ # 
#@ #set sh_command_abbrev_mode "Command-Line-Only"
#@ 
#@ #
#@ # Some useful aliases
#@ #
#@ alias list_commands		help
#@ alias report_constraints	report_constraint
#@ alias report_clocks		report_clock
#@ 
#@ #
#@ # The alias for get_clock was added when get_clock_network_objects
#@ # was introduced, as it conflicts with get_clocks (and get_clock is a
#@ # typical abbreviation for get_clocks)
#@ #
#@ alias get_clock get_clocks
#@ 
#@ 
#@ #
#@ #
#@ # The alias of q to quit is commented out.  Remove the comment 
#@ # character if you want this alias.  Some users find that having 
#@ # this particular alias causes problems when mixed with page-mode
#@ # for reports - an accidental repeated 'q' not only cancels the
#@ # output but exits the tool.
#@ #
#@ #alias q quit
#@ 
#@ 
#@ # -- End source /CMC/tools/synopsys/syn2005/pt_X-2005.06/admin/setup/.synopsys_pt.setup

set search_path [list {.} + {/cad2/ece451/synopsys}]
set link_library [list ece451_cells.db]
read_verilog control_syn.v
current_design control
link
source -echo -verbose constraints.scr
#@ create_clock -name "phi1" -period 15.04 -waveform { "0.0" "5.15" } { "phi1" }
#@ create_clock -name "phi2" -period 15.04 -waveform { "5.40" "14.79" } { "phi2" } 
#@ 
#@ set_output_delay -clock phi1 -clock_fall -max 3.2     { "ASelect" "zeroSelect" "BSelect" "DSelect" }
#@ 
#@ set_max_delay 0.2 -from { "phi1" } -to { "notphi1_1" "notphi1_2" }
#@ 
#@ set_output_delay -clock phi1 -clock_fall -max 5.0 { ARdEn }
#@ 
#@ set_output_delay -clock phi1 -clock_fall -max 5.0 { BRdEn }
#@ 
#@ set_output_delay -clock phi2 -clock_fall -max 1.8 { WriteEn }
#@ 
#@ set_max_delay 2.1 -from { "phi2" } -to { WriteEn }
#@ 
#@ set_output_delay -clock phi2 -clock_fall -max 3.3     { "shl" "notshl" "shr" "notshr" }
#@ 
#@ set_output_delay -clock phi2 -clock_fall -max 5.8 { N }
#@ 
#@ set_output_delay -clock phi2 -clock_fall -max 9.3 { L }
#@ 
#@ set_output_delay -clock phi2 -clock_fall -max 9.3 { M }
#@ # -- End source constraints.scr

read_parasitics -format SPEF control_routed.spef
set_propagated_clock [all_clocks]
report_timing -max_paths 10 > sta_timing.rpt
exit
