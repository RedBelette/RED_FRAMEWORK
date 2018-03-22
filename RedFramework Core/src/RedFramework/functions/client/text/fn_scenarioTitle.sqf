if (isServer and !hasInterface) exitWith {};

params ["_title", "_author"];

diag_log ["Start RedFramework\functions\client\text\fn_scenarioTitle.sqf", _title, _author];

[_title, _author] spawn {

	_title = _this select 0;
	_author = _this select 1;

	diag_log ["Start Spawn RedFramework\functions\client\text\fn_scenarioTitle.sqf", _title, _author];

	[parseText format ["<t align='right' size='1.2'><t font='PuristaBold' size='1.6'>""%1""</t><t>%2</t>", toUpper _title, _author], true, nil, 7, 0.7, 0] call BIS_fnc_textTiles;

	diag_log ["End Spawn RedFramework\functions\client\text\fn_scenarioTitle.sqf", _title, _author];

};

diag_log ["End RedFramework\functions\client\text\fn_scenarioTitle.sqf", _title, _author];

