/*
* Function name / Nom de la fonction: RF_fnc_locations
* Author / Auteur: RedBelette
* Since version / Depuis la version: 1.0.0
* Doc URL: http://www.redframework.com/project-detail/core
*
* EN:
* Usage: Returns all the cities of the map.
* Example: call RF_fnc_locations;
*
* FR:
* Utilisation: Retourne l'ensemble des villes de la carte.
* Exemple: call RF_fnc_locations;
*/
_centerOfTheWorld = getArray (configFile >> "CfgWorlds" >> worldName >> "centerPosition");
_locations = nearestLocations [_centerOfTheWorld, ["NameVillage", "NameCity", "NameCityCapital"], worldSize];

_locations