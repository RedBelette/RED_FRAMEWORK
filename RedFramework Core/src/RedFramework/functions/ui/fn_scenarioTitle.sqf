/*
* Function name / Nom de la fonction: RF_fnc_scenarioTitle
* Author / Auteur: RedBelette
* Since version / Depuis la version: 1.0.0
* Doc URL: http://www.redframework.com/project-detail/core
*
* EN:
* Usage: Displays the name of the scenario and its author at the bottom right.
* Example: ["My mission", "By RedBelette"] call RF_fnc_scenarioTitle;
*
* FR:
* Utilisation: Affiche le nom du scénario et son auteur en bas à droite.
* Exemple: ["My mission", "By RedBelette"] call RF_fnc_scenarioTitle;
*/
if (isServer and !hasInterface) exitWith {};

params ["_title", "_author"];

[_title, _author] spawn {

	_title = _this select 0;
	_author = _this select 1;

	[parseText format ["<t align='right' size='1.2'><t font='PuristaBold' size='1.6'>""%1""</t><t>%2</t>", toUpper _title, _author], true, nil, 7, 0.7, 0] call BIS_fnc_textTiles;

};

