/* ----------------------------------------------------------------------------------------------------
Function:
	GKB_fnc_drawToMap

Author:
	Gekkibi

Terms for copying, distribution and modification:
	Attribution-NonCommercial-ShareAlike 3.0 Unported (CC BY-NC-SA 3.0)
	http://creativecommons.org/licenses/by-nc-sa/3.0/

Description:
	Draw lines locally to the map.

Parameters:
	1st	Arrays in array		Line end positions
	2nd	Number			Line width
	3rd	Array			Line color (string) and alpha (number)

Returns:
	Marker names in an array

Example:
	_markerArray = [
		[
			[1200, 3000],
			[1600, 2800],
			[1500, 3000]
		],
		5,
		["ColorRed", 1]
	] call GKB_fnc_drawToMap;
---------------------------------------------------------------------------------------------------- */

	private ["_alpha", "_center", "_color", "_direction", "_length", "_marker", "_markerArray", "_posArray", "_width"];
	_posArray = _this select 0;
	_width = _this select 1;
	_color = _this select 2 select 0;
	_alpha = _this select 2 select 1;
	_markerArray = [];
	for "_x" from 0 to count _posArray - 2 do {
		_center = [((_posArray select _x select 0) + (_posArray select _x + 1 select 0)) / 2, ((_posArray select _x select 1) + (_posArray select _x + 1 select 1)) / 2];
		_direction = ((_posArray select _x + 1 select 0) - (_posArray select _x select 0)) atan2 ((_posArray select _x + 1 select 1) - (_posArray select _x select 1));
		_length = sqrt (((_posArray select _x select 0) - (_posArray select _x + 1 select 0)) ^ 2 + ((_posArray select _x select 1) - (_posArray select _x + 1 select 1)) ^ 2);
		for "_y" from 1 to 9001 do {
			_marker = "GKB_drawToMap_" + str(_y);
			if (markerShape _marker == "") exitWith {};
		};
		createMarker [_marker, _center];
		_marker setMarkerShape "RECTANGLE";
		_marker setMarkerBrush "SolidFull";
		_marker setMarkerSize [_width / 2, _length / 2];
		_marker setMarkerDir _direction;
		_marker setMarkerAlpha _alpha;
		_marker setMarkerColor _color;
		_markerArray set [count _markerArray, _marker];
	};
	{
		for "_y" from 1 to 9001 do {
			_marker = "GKB_drawToMap_" + str(_y);
			if (markerShape _marker == "") exitWith {};
		};
		createMarker [_marker, _x];
		_marker setMarkerShape "ELLIPSE";
		_marker setMarkerBrush "SolidFull";
		_marker setMarkerSize [_width / 2, _width / 2];
		_marker setMarkerAlpha _alpha;
		_marker setMarkerColor _color;
		_markerArray set [count _markerArray, _marker];
	} forEach _posArray;
	_markerArray