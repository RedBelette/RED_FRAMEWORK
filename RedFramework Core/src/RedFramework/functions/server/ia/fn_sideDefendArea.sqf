if (!isServer) exitWith {};

params ["_side", "_pos", "_radius"];

{
	_leaderGroup = leader _x;
	if (side _leaderGroup == _side) then {
		[_leaderGroup, _pos, _radius] call CBA_fnc_taskDefend;
	};
} forEach allGroups;
