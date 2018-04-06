/*
* Function name / Nom de la fonction: RF_fnc_heliInit
* Author / Auteur: RedBelette
* Since version / Depuis la version: 1.0.0
* Doc URL: http://www.redframework.com/project-detail/core
*
* EN:
* Usage: Initialize a helicopter so that it stays quietly on the ground.
* Example: [_heliGroup] call RF_fnc_heliInit;
*
* FR:
* Utilisation: Initialise une hélicoptère pour qu'il reste sagement au sol.
* Exemple: [_heliGroup] call RF_fnc_heliInit;
*/
if (!isServer) exitWith {};

params ["_thisGroup"];

diag_log ["Start RF_fnc_heliInit", _thisGroup];

_helicoSave = "";
{
	diag_log ["check _x", _x, "check vehicle _x", vehicle _x];
	if !(_helicoSave isEqualTo (vehicle _x)) then {
		_helicoSave = vehicle _x;
		_helicoSave setFuel 0;
		_helicoSave setBehaviour "CARELESS";
		_helicoSave setCombatMode "BLUE";
		diag_log ["helico set fuel to 0, behaviour careless and combatMode blue", _helicoSave, "for _x", _x];
	};

} forEach units _thisGroup;

diag_log ["End RF_fnc_heliInit"];