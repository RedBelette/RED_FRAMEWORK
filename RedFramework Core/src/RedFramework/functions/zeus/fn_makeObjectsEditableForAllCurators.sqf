/*
* Function name / Nom de la fonction: RF_fnc_makeObjectsEditableForAllCurators
* Author / Auteur: RedBelette
* Since version / Depuis la version: 1.0.0
* Doc URL: http://www.redframework.com/project-detail/core
*
* EN:
* Usage: Allows to make editable all the objects passed in parameter.
* Example: [[object1,object2]] call RF_fnc_makeObjectsEditableForAllCurators;
*
* FR:
* Utilisation: Permet de rendre éditable tous les objets passés en paramètre.
* Exemple: [[object1,object2]] call RF_fnc_makeObjectsEditableForAllCurators;
*/
params ["_objects"];

{
	_curator = _x;
	{
		_curator addCuratorEditableObjects [[_x], true];
	} foreach _objects;
} foreach allCurators;