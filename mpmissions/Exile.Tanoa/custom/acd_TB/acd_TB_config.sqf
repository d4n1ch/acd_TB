/*
	ACD_TB - Tanoa Bridges
	acd_TB_config.sqf
	by d4n1ch
	mailto: d.e@acd.su
*/
acd_debug = true; /* ACiDy Debug for some scripts */
/*#######################################################################################################################################
 WEST BRIDGE
#######################################################################################################################################*/
acd_TB_WEST_BRIDGE_enabled = true;
/*#####################################################################################################################################*/
	acd_TB_WEST_BRIDGE_DO_remove = true; /* Remove/hide trees and objects */
	acd_TB_WEST_BRIDGE_extra_objects = true; /* Build extra objects */
	acd_TB_WEST_BRIDGE_map_markers = true; /* Use map markers */
	acd_TB_WEST_BRIDGE_remove_trees_positions = 
	[
		[4213.44,8377.34,0.00149155],
		[4218.18,8379.27,0.00168896],
		[4168.59,8349.32,0.00143766],
		[4160.17,8344.85,0.00143814],
		[4080.51,8298.69,0.00143814],
		[4036.42,8273.41,0.00143862]
	];
/*#######################################################################################################################################
 SOUTH BRIDGE
#######################################################################################################################################*/
acd_TB_SOUTH_BRIDGE_enabled = true; /* SOUTH Main Bridge */
/*#####################################################################################################################################*/
	acd_TB_SOUTH_BRIDGE_DO_remove = true; /* Remove/hide trees ad objects */
	acd_TB_SOUTH_BRIDGE_extra_objects = true; /* Build extra objects */
	acd_TB_SOUTH_BRIDGE_map_markers = true; /* Use map markers */
	acd_TB_SOUTH_BRIDGE_remove_trees_positions = [];
	acd_TB_SOUTH_BRIDGE_remove_objects = [
		[[7153.93,4250.76,0],79708], 
		[[7154.52,4251.42,0], 79713],
		[[7175.1,4256.3,0], 79759], 
		[[7183.13,4242.67,0], 79756], 
		[[7147.77,4222.68,0], 79740], 
		[[7153.45,4240.81,0], 79734], 
		[[7157.15,4254.6,0], 79564], 
		[[7156.67,4254.61,0], 79684], 
		[[7155.92,4254.62,0], 79701]
	];

/*#####################################################################################################################################*/
if(isNil("acd_fnc_build"))then{acd_fnc_build = compile preprocessFile "custom\acd_TB\functions\acd_fnc_build.sqf";};
if(isNil("acd_fnc_removeObj"))then{acd_fnc_removeObj = compile preprocessFile "custom\acd_TB\functions\acd_fnc_removeObj.sqf";};
if(isNil("acd_fnc_removeGreen"))then{acd_fnc_removeGreen = compile preprocessFile "custom\acd_TB\functions\acd_fnc_removeGreen.sqf";};
if(isNil("acd_fnc_precompileProps"))then{acd_fnc_precompileProps = compile preprocessFile "custom\acd_TB\functions\acd_fnc_precompileProps.sqf";};
diag_log format ["### ACD: acd_TB_config.sqf: configuration successfully loaded ###"];
call acd_fnc_precompileProps;
/*#####################################################################################################################################*/