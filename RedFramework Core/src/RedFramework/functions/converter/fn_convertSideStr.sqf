/*
* Function name / Nom de la fonction: RF_fnc_convertSideStr
* Author / Auteur: RedBelette
* Since version / Depuis la version: 1.0.0
* Doc URL: http://www.redframework.com/project-detail/core
*
* EN:
* Usage: Convert a string representing the faction to the faction object
* Example: ["west"] call RF_fnc_convertSideStr;
*
* FR:
* Utilisation: Converti une chaine de caractère représentant la faction en faction
* Exemple: ["west"] call RF_fnc_convertSideStr;
*/
params ["_side"];

switch (_side) do
{
	case "east":
	{
		_side = east;
	};

	case "west":
	{
		_side = west;
	};

	case "resistance":
	{
		_side = resistance;
	};

	case "civilian":
	{
		_side = civilian;
	};

	default
	{
		_side = nil;
	};
};

_side