/*
* Function name / Nom de la fonction: RF_fnc_makeAllUnitsEditableForAllCurators
* Author / Auteur: RedBelette
* Since version / Depuis la version: 1.0.0
* Doc URL: http://www.redframework.com/project-detail/core
*
* EN:
* Usage: Allows zeus to modify all new spawner units by script.
* Example:  call RF_fnc_makeAllUnitsEditableForAllCurators;
*
* FR:
* Utilisation: Permet à zeus de modifier toutes les unités nouvellements spawner par script.
* Exemple: call RF_fnc_makeAllUnitsEditableForAllCurators;
*/
{
	_curator = _x;
	{
		_curator addCuratorEditableObjects [[_x], true];
	} foreach allunits;
} foreach allCurators;