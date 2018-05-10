/*
* Function name / Nom de la fonction: RF_fnc_addSpectatorAction
* Author / Auteur: RedBelette
* Since version / Depuis la version: 1.0.3
* Doc URL: http://www.redframework.com/project-detail/core
*
* EN:
* Usage: Add an action to enter spectator mode
* Example: [_object] call RF_fnc_addSpectatorAction;
*
* FR:
* Utilisation: Ajoute une action permettant de rentrer en mode spectateur
* Exemple: [_object] call RF_fnc_addSpectatorAction;
*/
params ["_object"];

// add action to the server to see action when editing
_object addAction ["Enter to spectator mode", {call RF_fnc_spectator;}];

// add action on each client for MP
[
	[_object],
	{
		params ["_object"];
		_object addAction ["Enter to spectator mode", {call RF_fnc_spectator;}];
	}
] remoteExec ["call", 0, true];
