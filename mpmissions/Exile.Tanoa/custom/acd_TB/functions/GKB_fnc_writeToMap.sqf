/* ----------------------------------------------------------------------------------------------------
Function:
	GKB_fnc_writeToMap

Author:
	Gekkibi

Terms for copying, distribution and modification:
	Attribution-NonCommercial-ShareAlike 3.0 Unported (CC BY-NC-SA 3.0)
	http://creativecommons.org/licenses/by-nc-sa/3.0/

Description:
	Write text locally to the map. Requires GKB_fnc_writeToMapFont.

Parameters:
	1st	Numbers in array	Position of the text
	2nd	Numbers in array	Rotation and the size of the text. Negative rotation rotates
					the text clockwise
	3rd	Array			Text (string), text color (string) and alpha (number)

Returns:
	Marker names in an array

Example:
	_text = [
		[1000, 5000],
		[-20, 2],
		["suspected enemy minefield!", "ColorRed", 0.9]
	] call GKB_fnc_writeToMap;
---------------------------------------------------------------------------------------------------- */

	private ["_alpha", "_color", "_createMarker", "_direction", "_marker", "_markerArray", "_offset", "_position", "_scale", "_symbol", "_text"];
	_position = _this select 0;
	_direction = _this select 1 select 0;
	_scale = _this select 1 select 1;
	_text = toArray (_this select 2 select 0);
	_color = _this select 2 select 1;
	_alpha = _this select 2 select 2;
	_markerArray = [];
	_offset = [0, 0];
	for "_y" from 1 to count _text do {
		_symbol = toString [_text select _y - 1] call GKB_fnc_writeToMapFont;
		{
			private ["_AdjustDirection", "_adjustPosition", "_adjustSize", "_vectorDirection", "_vectorLength"];
			_vectorDirection = (_x select 0 select 0) atan2 (_x select 0 select 1) - _direction;
			_vectorLength = sqrt ((_x select 0 select 0) ^ 2 + (_x select 0 select 1) ^ 2);
			_adjustPosition = [sin _vectorDirection * _vectorLength * _scale, cos _vectorDirection * _vectorLength * _scale];
			_adjustSize = _x select 1;
			_adjustDirection = (_x select 2) - _direction;
			for "_z" from 1 to 9001 do {
				_marker = "GKB_writeToMap_" + str(_y) + "_" + str(_z);
				if (markerShape _marker == "") exitWith {};
			};
			createMarker [_marker, [(_position select 0) + (_adjustPosition select 0) + (_offset select 0), (_position select 1) + (_adjustPosition select 1) + (_offset select 1)]];
			_marker setMarkerShape "RECTANGLE";
			_marker setMarkerBrush "SolidFull";
			_marker setMarkerSize [_scale, _scale * _adjustSize];
			_marker setMarkerDir _adjustDirection;
			_marker setMarkerAlpha _alpha;
			_marker setMarkerColor _color;
			_markerArray set [count _markerArray, _marker];
		} forEach (_symbol select 0);
		_offset = [
			(_offset select 0) + (_symbol select 1) * _scale * cos _direction,
			(_offset select 1) + (_symbol select 1) * _scale * sin _direction
		];
	};
	_markerArray