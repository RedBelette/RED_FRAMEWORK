params ["_heli", "_landingPos", "_getOutPos"];

_crewGroup = group (driver _heli);

_waypoint = _crewGroup addWaypoint [_landingPos, 0];
_waypoint setWaypointType "TR UNLOAD";
_waypoint = _crewGroup addWaypoint [_getOutPos, 0];
_waypoint setWaypointStatements ["true", "
_heli = vehicle this;
{
	deleteVehicle _x;
} forEach crew _heli;
deleteVehicle _heli;
"];

