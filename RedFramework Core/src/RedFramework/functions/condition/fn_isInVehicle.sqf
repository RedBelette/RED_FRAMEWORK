/*
* Function name / Nom de la fonction: RF_fnc_isInVehicle
* Author / Auteur: RedBelette
* Since version / Depuis la version: 1.0.0
* Doc URL: http://www.redframework.com/project-detail/core
*
* EN:
* Usage: Check if the unit is inside a vehicle
* Example: [player] call RF_fnc_isInVehicle;
*
* FR:
* Utilisation: Vérifie si l'unité est à l'intérieur d'un véhicule
* Exemple: [player] call RF_fnc_isInVehicle;
*/
params["_unit"];

_inVehicle = false;
// vehicle _unit != _unit => something strange ... check if the player is inside vehicle
if (vehicle _unit != _unit) then {
	_inVehicle = true;
};

_inVehicle