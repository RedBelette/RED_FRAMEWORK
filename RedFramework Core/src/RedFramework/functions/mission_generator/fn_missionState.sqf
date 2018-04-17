/*
* Function name / Nom de la fonction: RF_fnc_missionState
* Author / Auteur: RedBelette
* Since version / Depuis la version: 1.0.0
* Doc URL: http://www.redframework.com/project-detail/core
*
* EN:
* Usage: Returns the current state of the mission.
* Example: call RF_fnc_missionState;
*
* FR:
* Utilisation: Retourne l'état courant de la mission.
* Exemple: call RF_fnc_missionState;
*/
params ["_missionID"];

_type = [_missionID] call BIS_fnc_taskState;

_type