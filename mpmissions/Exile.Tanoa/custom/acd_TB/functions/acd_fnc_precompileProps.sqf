/*
	ACD_TB - Tanoa Bridges
	acd_fnc_precompileProps.sqf
	by d4n1ch
	mailto: d.e@acd.su
	
*/
private["_tb_list","_debug_local"];
_debug_local = false;
if(acd_debug)then{
_debug_local = true;
};
if (isNil "_tb_list") then {
	_tb_list = [];
	if (acd_TB_WEST_BRIDGE_enabled) then {_tb_list = _tb_list + ["acd_TB_WEST_BRIDGE"];};
	if (acd_TB_SOUTH_BRIDGE_enabled) then {_tb_list = _tb_list + ["acd_TB_SOUTH_BRIDGE"];};
};

{
	_tb_name = _x;
	_tb_file = compile preprocessFile format["custom\acd_TB\code\%1_props.sqf",_tb_name];
	if(_debug_local)then{diag_log format ["### ACD: call compile preprocessFile %1_props.sqf ###",_tb_name];};
	call _tb_file;
}forEach _tb_list;