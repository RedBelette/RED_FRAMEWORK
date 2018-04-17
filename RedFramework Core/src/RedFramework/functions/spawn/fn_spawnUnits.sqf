/*
* Function name / Nom de la fonction: RF_fnc_spawnUnits
* Author / Auteur: RedBelette
* Since version / Depuis la version: 1.0.0
* Doc URL: http://www.redframework.com/project-detail/core
*
* EN:
* Usage: Create units.
* Example: [west, ["B_Soldier_F","B_Soldier_F","B_Soldier_F"], _spawnPos] call RF_fnc_spawnUnits;
*
* FR:
* Utilisation: Créer des unités.
* Exemple: [west, ["B_Soldier_F","B_Soldier_F","B_Soldier_F"], _spawnPos] call RF_fnc_spawnUnits;
*/
if (!isServer) exitWith {};

params ["_side", "_unitTypes", "_spawnPos"];

_group1 = createGroup _side;

_count = (count _unitTypes) - 1;
for "_x" from 0 to _count do {
	_unitType = _unitTypes select _x;
	_unit1 = _group1 createUnit [_unitType, [_spawnPos select 0,_spawnPos select 1,1], [], 1, "NONE"];
};

_group1