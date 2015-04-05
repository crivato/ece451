#######################################################
#                                                     #
#  Encounter Command Logging File                     #
#  Created on Sat Apr  4 20:47:00 2015                #
#                                                     #
#######################################################

#@(#)CDS: Encounter v09.12-s159_1 (32bit) 07/15/2010 13:17 (Linux 2.6)
#@(#)CDS: NanoRoute v09.12-s013 NR100629-2344/USR64-UB (database version 2.30, 102.1.1) {superthreading v1.15}
#@(#)CDS: CeltIC v09.12-s012_1 (32bit) 07/01/2010 02:29:05 (Linux 2.6.9-89.0.19.ELsmp)
#@(#)CDS: AAE 09.12-e022 (32bit) 07/15/2010 (Linux 2.6.9-89.0.19.ELsmp)
#@(#)CDS: CTE 09.12-s069_1 (32bit) Jul 15 2010 05:39:06 (Linux 2.6.9-89.0.19.ELsmp)
#@(#)CDS: CPE v09.12-s009

getenv ENCOUNTER_CONFIG_RELATIVE_CWD
setDoAssign
getIoFlowFlag
setUIVar rda_Input ui_gndnet VSS
setUIVar rda_Input ui_leffile ../../../../../../cad/cad2/ece451/se/ece451_cells.lef
setUIVar rda_Input ui_netlist {control_syn.v ../../../../../../cad/cad2/ece451/verilog/ece451_cells.v}
setUIVar rda_Input ui_topcell control
setUIVar rda_Input ui_pwrnet VDD
commitConfig
fit
setDrawView fplan
getIoFlowFlag
setIoFlowFlag 0
floorPlan -site CORE -r 0.5 0.85 2.5 2.5 2.5 2.5
uiSetTool select
getIoFlowFlag
fit
setIoFlowFlag 0
floorPlan -site CORE -r 0.42311980335 0.850001 2.8 2.8 2.5 2.5
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
selectMarker 0.2000 0.2000 1.2000 1.2000 2 1 2
deselectAll
selectMarker 0.2000 0.2000 1.2000 1.2000 2 1 2
deselectAll
selectMarker 0.2000 0.2000 1.2000 1.2000 2 1 2
windowSelect -0.631 1.379 1.607 0.048
deselectAll
selectMarker 0.2000 0.2000 1.2000 1.2000 2 1 2
verifyConnectivity -type all -error 1000 -warning 50
verifyGeometry
selectMarker 2.8000 46.0700 187.6000 53.2000 -1 3 7
deselectAll
selectMarker 2.8000 46.0700 187.6000 53.2000 -1 3 7
verifyConnectivity -type all -noAntenna -error 1000 -warning 50
verifyConnectivity -type all -noAntenna -error 1000 -warning 50
selectObject IO_Pin {ctrl[0]}
deselectAll
selectMarker 144.4500 37.5500 145.1500 38.2500 1 1 6
deselectAll
selectMarker 143.2500 30.3500 143.9500 31.0500 1 1 6
verifyGeometry
setNanoRouteMode -quiet -drouteStartIteration default
setNanoRouteMode -quiet -routeTopRoutingLayer default
setNanoRouteMode -quiet -routeBottomRoutingLayer default
setNanoRouteMode -quiet -drouteEndIteration default
setNanoRouteMode -quiet -routeWithTimingDriven false
setNanoRouteMode -quiet -routeWithSiDriven false
routeDesign -globalDetail
sroute -connect { blockPin padPin padRing corePin floatingStripe } -layerChangeRange { met1 met3 } -blockPinTarget { nearestRingStripe nearestTarget } -padPinPortConnect { allPort oneGeom } -checkAlignedSecondaryPin 1 -blockPin useLef -allowJogging 1 -crossoverViaBottomLayer met1 -allowLayerChange 1 -targetViaTopLayer met3 -crossoverViaTopLayer met3 -targetViaBottomLayer met1 -nets { VSS VDD }
selectWire 2.8000 39.4500 187.6000 41.7500 1 VSS
deselectAll
selectWire 2.8000 39.4500 187.6000 41.7500 1 VSS
deselectAll
selectMarker 3.9000 40.5500 4.0000 40.6500 1 3 7
deselectAll
selectWire 2.8000 2.8000 187.6000 3.9500 1 VDD
deselectAll
selectMarker 3.3250 3.3250 3.4250 3.4250 1 3 7
