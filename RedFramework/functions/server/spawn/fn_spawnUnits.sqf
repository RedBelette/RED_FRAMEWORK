if (!isServer) exitWith {};

params ["_side", "_unitTypes", "_spawnPos"];

diag_log ["RF_fnc_spawnUnits", _side, _unitTypes, _spawnPos];

_group1 = createGroup _side;

_count = (count _unitTypes) - 1;
for "_x" from 0 to _count do {
	_unitType = _unitTypes select _x;
	_unit1 = _group1 createUnit [_unitType, [_spawnPos select 0,_spawnPos select 1,1], [], 1, "NONE"];
};

_group1