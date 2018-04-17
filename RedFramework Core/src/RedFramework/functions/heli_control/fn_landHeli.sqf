/*
* Function name / Nom de la fonction: RF_fnc_landHeli
* Author / Auteur: RedBelette
* Since version / Depuis la version: 1.0.0
* Doc URL: http://www.redframework.com/project-detail/core
*
* EN:
* Usage: Order the helicopter to land in the desired area.
* Example: [_heliGroup, _returnPosition] call RF_fnc_landHeli;
*
* FR:
* Utilisation: Ordonne à l'hélicoptère de se poser dans la zone souhaitée.
* Exemple: [_heliGroup, _returnPosition] call RF_fnc_landHeli;
*/
if (!isServer) exitWith {};

params ["_helicoGroup", "_returnPos"];

// Delete all waypoints of the helicopters
while {(count (waypoints _helicoGroup)) > 0} do {
	deleteWaypoint ((waypoints _helicoGroup) select 0);
};

// Stay cool
_helicoGroup setBehaviour "CARELESS";
_helicoGroup setCombatMode "BLUE";

// Add waypoint for return position
_helicoGroup addWaypoint [_returnPos,0];

// Do not execute more than one by helicopter
_helicoSave = "";
_helicos = [];
{
 if !(_helicoSave isEqualTo (vehicle _x)) then {
	  _helicoSave = vehicle _x;
	  _helicos pushBack _helicoSave;
 };

} forEach units _helicoGroup;

{ // For each helicopter
	_heli = _x;

	[_heli, _returnPos] spawn { // Create a process by helicopter
		_heli = _this select 0;
		_returnPos = _this select 1;
		while {alive _heli and (_heli distance _returnPos) > 300} do {}; // Wait that the helicopter are in position
		sleep random 30; // Sleep random is necessary to prevent helicopters crash
		_heli land "LAND"; // Land to position
		while {alive _heli and !isTouchingGround _heli} do {}; // Wait that the helicopter touching grounds to setFuel 0
		_heli setFuel 0;
	};

} forEach _helicos;