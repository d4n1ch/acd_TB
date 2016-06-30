/*
	ACD_TB - Tanoa Bridges
	acd_fnc_build.sqf
	by d4n1ch
	mailto: d.e@acd.su
	
*/
private["_build_style","_object_list","_debug_local"];
_build_style = _this select 0;
_object_list = _this select 1;
if(isNil("_build_style"))then{_build_style = "default"};
if(_build_style == "default")then{
	{
		private ["_obj"];
		_obj = createVehicle [_x select 0, [0,0,0], [], 0, "CAN_COLLIDE"];
		if (_x select 4) then {
			_obj setDir (_x select 2);
			_obj setPos (_x select 1);
		} else {
			_obj setPosATL (_x select 1);
			_obj setVectorDirAndUp (_x select 3);
		};
	} foreach _object_list;
}else{
	if(_build_style == "v1")then{
		{
			private ["_obj"];
			_obj = createVehicle [_x select 0, [0,0,0], [], 0, "NONE"];
			if (_x select 4) then {
				_obj setDir (_x select 2);
				_obj setPos (_x select 1);
			} else {
				_obj setPosATL (_x select 1);
				_obj setVectorDirAndUp (_x select 3);
			};
		} foreach _objs;
	}else{
		if(_build_style == "v2")then{
			{
				private ["_obj"];
				_obj = createVehicle [_x select 0, (_x select 1), [], 0, "CAN_COLLIDE"];
			
				if (_x select 4) then {
					_obj setDir (_x select 2);
					_obj setPos (_x select 1);
				} else {
			
					_obj setVectorDirAndUp (_x select 3);
					_obj setPosATL (_x select 1);
				};
			
			} foreach _objs;
		};
	};
};
