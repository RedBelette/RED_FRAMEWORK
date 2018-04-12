/*
* Function name / Nom de la fonction: RF_fnc_sendHeliToFight
* Author / Auteur: RedBelette
* Since version / Depuis la version: 1.0.0
* Doc URL: http://www.redframework.com/project-detail/core
*
* EN:
* Usage: Send the helicopter to fight.
* Example: [_heliGroup, _attackPosition, 200] call RF_fnc_sendHeliToFight;
*
* FR:
* Utilisation: Envoi l'hélicoptère au combat.
* Exemple: [_heliGroup, _attackPosition, 200] call RF_fnc_sendHeliToFight;
*/
if (!isServer) exitWith {};

params ["_helicoGroup", "_attackPos", "_radius"];

helicoGo = false;

diag_log ["RF_fnc_sendHeliToFight", _helicoGroup, _attackPos, _radius];

_helicoGroup setBehaviour "COMBAT";
_helicoGroup setCombatMode "RED";

{
	_x enableAI "ALL";
} forEach units _helicoGroup;

_helicoSave = "";
{
 if !(_helicoSave isEqualTo (vehicle _x)) then {
	  _helicoSave = vehicle _x;
	  _helicoSave land "NONE";
	  _helicoSave setFuel 1;
 };

} forEach units _helicoGroup;


[_helicoGroup, _attackPos, _radius] call CBA_fnc_taskAttack;