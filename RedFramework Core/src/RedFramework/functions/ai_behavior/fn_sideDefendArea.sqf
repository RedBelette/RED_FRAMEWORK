/*
* Function name / Nom de la fonction: RF_fnc_sideDefendArea
* Author / Auteur: RedBelette
* Since version / Depuis la version: 1.0.0
* Doc URL: http://www.redframework.com/project-detail/core
*
* EN:
* Usage: Order the entire faction to defend an area around a radius.
* Example: [east, getPos _location, 300] call RF_fnc_sideDefendArea;
*
* FR:
* Utilisation: Ordonne à la faction entière de défendre une zone autour d'un rayon.
* Exemple: [east, getPos _location, 300] call RF_fnc_sideDefendArea;
*/
if (!isServer) exitWith {};

params ["_side", "_pos", "_radius"];

{
	_leaderGroup = leader _x;
	if (side _leaderGroup == _side) then {
		[_leaderGroup, _pos, _radius] call CBA_fnc_taskDefend;
	};
} forEach allGroups;
