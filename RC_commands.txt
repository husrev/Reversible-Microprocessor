# Cadence Encounter(R) RTL Compiler
#   version RC13.10 - v13.10-s006_1 (64-bit) built Feb  5 2014
#
# Run with the following arguments:
#   -logfile rc.log
#   -cmdfile rc.cmd


set_attribute library /work/kits/ams/HK400/liberty/c35_3.3V/c35_CORELIB.lib
read_hdl RFA.v
elaborate
check_design -all
gui_show
gui_raise
gui_sync
synthesize
synthesize
synthesizes
write -mapped > TOP_syn.v
write_sdc > TOP.sdc
write_sdf > TOP.sdf
report_timing >timing_report.txt


exit