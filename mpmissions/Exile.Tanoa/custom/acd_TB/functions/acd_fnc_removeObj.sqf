/*
	ACD_TB - Tanoa Bridges
	acd_fnc_removeObj.sqf
	by d4n1ch
	mailto: d.e@acd.su
	
	Usage: [_object_list] call acd_fnc_removeObj;
	
	_object_list = [
		[_pos, _object_id],
		[_pos, _object_id]
	]
*/
private["_object_list","_debug_local"];
if(acd_debug)then{_debug_local = true;};
_object_list = _this select 0;
{
	_pos = _x select 0;
	_object_id = _x select 1;
	_tmp_obj = _pos nearestObject _object_id;
	_tmp_obj hideObjectGlobal true;
	_tmp_obj hideObject true;
	_tmp_obj setdammage 1;
	if(_debug_local)then{
		diag_log format ["### ACD: acd_fnc_removeObj.sqf: removing %1 (%2) @ %3  ###",_tmp_obj,_object_id,_pos];
	};
	
}foreach _object_list;