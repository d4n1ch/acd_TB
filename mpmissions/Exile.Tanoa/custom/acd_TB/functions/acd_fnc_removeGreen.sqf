/*
	ACD_TB - Tanoa Bridges
	acd_fnc_removeGreen.sqf
	by d4n1ch
	mailto: d.e@acd.su
*/
private["_positions"];
_debug = false;
if(acd_debug)then{_debug = true;};
_positions = _this select 0;
_distance = _this select 1;
{
	if(isNil "_distance")then{_distance = 10;};
    private["_obj"];
	_obj = (nearestTerrainObjects [_x, ["Tree","Bush"], _distance]);
	{
		_x setdammage 1;
		_x hideObject true;
		_x hideObjectGlobal true;
		if(_debug)then{
			diag_log format ["### ACD: acd_fnc_removeGreen.sqf: removing %1  ###",_x];
		};
	}foreach _obj;
}
forEach _positions;