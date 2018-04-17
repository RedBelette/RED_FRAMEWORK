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

// execute the desactivation of the helicopter once.
_helicoSave = "";
{
	if !(_helicoSave isEqualTo (vehicle _x)) then {
		_helicoSave = vehicle _x;
		_helicoSave setFuel 0; // No full
		_helicoSave setBehaviour "CARELESS"; // Stay cool if ennemy approach
		_helicoSave setCombatMode "BLUE"; // Same
	};

} forEach units _thisGroup;