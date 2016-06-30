/* ----------------------------------------------------------------------------------------------------
Function:
	GKB_fnc_arrowToMap

Author:
	Gekkibi

Terms for copying, distribution and modification:
	Attribution-NonCommercial-ShareAlike 3.0 Unported (CC BY-NC-SA 3.0)
	http://creativecommons.org/licenses/by-nc-sa/3.0/

Description:
	Draws an arrow locally to the map. Requires GKB_fnc_drawToMap. Text inside the arrow requires
	GKB_fnc_writeToMap (optional).

Parameters:
	1st	Numbers in array	Position of the arrow
	2nd	Numbers in array	Direction, length, width and thickness of the arrow
	3rd	Array			Arrow color (string) and alpha (number)
	4th	Array (optional)	Arrow text (string), text offset position ("front", "back",
					"center"), text color (string and text alpha (number)

Returns:
	Marker names in an array

Example:
	_markerArray = [
		[2500, 3000],
		[45, 600, 50, 5],
		["ColorGreen", 1],
		["advance!", "front", "ColorBlue", 1]
	] call GKB_fnc_arrowToMap;
---------------------------------------------------------------------------------------------------- */

	private ["_alpha", "_color", "_direction", "_length", "_markerArray", "_markerTextArray", "_position", "_positionArray", "_textArray", "_thickness", "_width"];
	_position = _this select 0;
	_direction = _this select 1 select 0;
	_length = _this select 1 select 1;
	_width = _this select 1 select 2;
	_thickness = _this select 1 select 3;
	_color = _this select 2 select 0;
	_alpha = _this select 2 select 1;
	_textArray = _this select 3;
	_positionArray = [_position];
	{
		_positionArray set [count _positionArray,
			[
				(_position select 0) + sin (270 + _direction + (_x select 0)) * sqrt (_x select 1),
				(_position select 1) + cos (270 + _direction + (_x select 0)) * sqrt (_x select 1)

			]
		];
	} forEach [
		[-_width atan2 -_width, 2 * _width ^ 2],
		[-_width atan2 (_width / -2), 1.25 * _width ^ 2],
		[-_length atan2 (_width / -2), _length ^ 2 + (_width / 2) ^ 2],
		[-(_length atan2 (_width / 2)), _length ^ 2 + (_width / 2) ^ 2],
		[-(_width atan2 (_width / 2)), 1.25 * _width ^ 2],
		[-(_width atan2 _width), 2 * _width ^ 2]
	];
	_positionArray set [count _positionArray, _position];
	_markerArray = [
		_positionArray,
		_thickness,
		[_color, _alpha]
	] call GKB_fnc_drawToMap;
	if (!isNil "_textArray") then {
		private ["_symbol", "_text", "_textAlpha", "_textColor", "_textDirection", "_textLength", "_textOffset", "_textPosition"];
		_text = " " + (_textArray select 0);
		_textPosition = _textArray select 1;
		_textColor = _textArray select 2;
		_textAlpha = _textArray select 3;
		_textLength = 0;
		{
			_symbol = toString [_x] call GKB_fnc_writeToMapFont;
			_textLength = _textLength + (_symbol select 1) * _width / 30;
		} forEach toArray _text;
		if (_direction / 360 mod 1 <= 0.5) then {
			_textDirection = 90 - _direction;
			call {
				if (_textPosition == "front") exitWith {
					_textOffset = _width + _textLength;
				};
				if (_textPosition == "back") exitWith {
					_textOffset = _length;
				};
				if (_textPosition == "center") exitWith {
					_textOffset = (_length + _textLength) / 2;
				};
			};
		} else {
			_textDirection = -90 - _direction;
			call {
				if (_textPosition == "front") exitWith {
					_textOffset = _width;
				};
				if (_textPosition == "back") exitWith {
					_textOffset = _length - _textLength;
				};
				if (_textPosition == "center") exitWith {
					_textOffset = (_length - _textLength) / 2;
				};
			};
		};
		_markerTextArray = [
			[
				(_position select 0) + sin (180 + _direction) * _textOffset,
				(_position select 1) + cos (180 + _direction) * _textOffset
			],
			[_textDirection, _width / 30],
			[_text, _textColor, _textAlpha]
		] call GKB_fnc_writeToMap;
	} else {
		_markerTextArray = [];
	};
	{
		_markerArray set [count _markerArray, _x];
	} forEach _markerTextArray;
	_markerArray