params ["_group", "_spawnPos", "_landingPos", ["_heliClass", "B_Heli_Light_01_F"], ["_side", west], ["_crewPilot", "B_Helipilot_F"]];

_heli = createVehicle [_heliClass, [_spawnPos select 0, _spawnPos select 1], [], 0, "FLY"];
_crewGroup = createGroup [_side, true];
_pilot = _crewGroup createUnit [_crewPilot, getPos _heli, [], 0, "NONE"];
_pilot moveInDriver _heli;
_pilot setSkill 1;

{
 _x moveInCargo _heli;
} forEach units _group;
[[_group, _heli], {
	_group = _this select 0;
	_heli = _this select 1;
	{
	 _x moveInCargo _heli;
	} forEach units _group;
}] remoteExec ["bis_fnc_call", 0];

_waypoint = _crewGroup addWaypoint [_landingPos, 0];
_waypoint setWaypointType "TR UNLOAD";
_waypoint = _crewGroup addWaypoint [_spawnPos, 0];
_waypoint setWaypointStatements ["true", "
_heli = vehicle this;
{
	deleteVehicle _x;
} forEach crew _heli;
deleteVehicle _heli;
"];

