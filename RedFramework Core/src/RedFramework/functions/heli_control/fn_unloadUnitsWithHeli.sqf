/*
* Function name / Nom de la fonction: RF_fnc_unloadUnitsWithHeli
* Author / Auteur: RedBelette
* Since version / Depuis la version: 1.0.0
* Doc URL: http://www.redframework.com/project-detail/core
*
* EN:
* Usage: The helicopters unload the units present in an area and then disappear.
* Example: [_heli, _landingPos, _getOutPos] call RF_fnc_unloadUnitsWithHeli;
*
* FR:
* Utilisation: Les hélicoptères déchargent les unités présentes dans une zone et ensuite disparait.
* Exemple: [_heli, _landingPos, _getOutPos] call RF_fnc_unloadUnitsWithHeli;
*/
params ["_heli", "_landingPos", "_getOutPos"];

// Get driver crew.
_crewGroup = group (driver _heli);

// Add waypoint to landing position
_waypoint = _crewGroup addWaypoint [_landingPos, 0];
// Unload other groups
_waypoint setWaypointType "TR UNLOAD";
// Add waypoint to the out position
_waypoint = _crewGroup addWaypoint [_getOutPos, 0];
// Delete helicopter and crew when they arrived on position
_waypoint setWaypointStatements ["true", "
_heli = vehicle this;
{
	deleteVehicle _x;
} forEach crew _heli;
deleteVehicle _heli;
"];

