/*
* Function name / Nom de la fonction: RF_fnc_locationGenerator
* Author / Auteur: RedBelette
* Since version / Depuis la version: 1.0.0
* Doc URL: http://www.redframework.com/project-detail/core
*
* EN:
* Usage: Return a random location of the map.
* Example: call RF_fnc_locationGenerator;
*
* FR:
* Utilisation: Retourne une location au hasard de la carte.
* Exemple: call RF_fnc_locationGenerator;
*/
_locations = call RF_fnc_locations;
_randomLocation = _locations select (random (count _locations));
_locationPos = getPos _randomLocation;

_locationPos