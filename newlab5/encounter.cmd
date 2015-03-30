#######################################################
#                                                     #
#  Encounter Command Logging File                     #
#  Created on Sun Mar 29 22:34:12 2015                #
#                                                     #
#######################################################

#@(#)CDS: Encounter v09.12-s159_1 (32bit) 07/15/2010 13:17 (Linux 2.6)
#@(#)CDS: NanoRoute v09.12-s013 NR100629-2344/USR64-UB (database version 2.30, 102.1.1) {superthreading v1.15}
#@(#)CDS: CeltIC v09.12-s012_1 (32bit) 07/01/2010 02:29:05 (Linux 2.6.9-89.0.19.ELsmp)
#@(#)CDS: AAE 09.12-e022 (32bit) 07/15/2010 (Linux 2.6.9-89.0.19.ELsmp)
#@(#)CDS: CTE 09.12-s069_1 (32bit) Jul 15 2010 05:39:06 (Linux 2.6.9-89.0.19.ELsmp)
#@(#)CDS: CPE v09.12-s009

setUIVar rda_Input ui_gndnet VSS
setUIVar rda_Input ui_leffile ../../../../../../cad/cad2/ece451/se/ece451_cells.lef
setUIVar rda_Input ui_netlist {control_syn.v ../../../../../../cad/cad2/ece451/verilog/ece451_cells.v}
setUIVar rda_Input ui_topcell control
setUIVar rda_Input ui_pwrnet VDD
commitConfig
fit
setDrawView fplan
getenv ENCOUNTER_CONFIG_RELATIVE_CWD
setDoAssign
getIoFlowFlag
commitConfig
getIoFlowFlag
setIoFlowFlag 0
floorPlan -flip s -site CORE -r 0.5 0.85 2.5 2.5 2.5 2.5
uiSetTool select
getIoFlowFlag
fit
loadIoFile ioplace.ioc
getMultiCpuUsage -localCpu
setPlaceMode -fp false
placeDesign -prePlaceOpt
checkPlace control.checkPlace
setDrawView place
clearGlobalNets
globalNetConnect VDD -type pgpin -pin VDD -inst *
globalNetConnect VSS -type pgpin -pin VSS -inst *
globalNetConnect VSS -type tielo -inst *
globalNetConnect VDD -type tiehi -inst *
globalNetConnect VDD -type net -net {L[0]}
sroute -connect { blockPin padPin padRing corePin floatingStripe } -layerChangeRange { met1 met3 } -blockPinTarget { nearestRingStripe nearestTarget } -padPinPortConnect { allPort oneGeom } -checkAlignedSecondaryPin 1 -blockPin useLef -allowJogging 1 -crossoverViaBottomLayer met1 -allowLayerChange 1 -targetViaTopLayer met3 -crossoverViaTopLayer met3 -targetViaBottomLayer met1 -nets { VSS VDD }
setNanoRouteMode -quiet -drouteStartIteration default
setNanoRouteMode -quiet -routeTopRoutingLayer default
setNanoRouteMode -quiet -routeBottomRoutingLayer default
setNanoRouteMode -quiet -drouteEndIteration default
setNanoRouteMode -quiet -routeWithTimingDriven false
setNanoRouteMode -quiet -routeWithSiDriven false
routeDesign -globalDetail
verifyConnectivity -type all -noAntenna -error 1000 -warning 50
verifyGeometry
saveDesign control.enc
global dbgLefDefOutVersion
set dbgLefDefOutVersion 5.7
defOut -floorplan -netlist -routing control.def
set dbgLefDefOutVersion NULL
summaryReport -noHtml -outfile summaryReport.rpt
