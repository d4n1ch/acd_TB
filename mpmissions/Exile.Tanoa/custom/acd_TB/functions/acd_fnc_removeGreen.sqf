/*
	ACD_TB - Tanoa Bridges
	acd_fnc_removeGreen.sqf
	by d4n1ch
	mailto: d.e@acd.su
*/
private["_positions"];
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
	}foreach _obj;
}
forEach _positions;