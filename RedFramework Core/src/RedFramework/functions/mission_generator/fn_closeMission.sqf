/*
* Function name / Nom de la fonction: RF_fnc_closeMission
* Author / Auteur: RedBelette
* Since version / Depuis la version: 1.0.0
* Doc URL: http://www.redframework.com/project-detail/core
*
* EN:
* Usage: Closes the mission identified by the missionID passed in parameter.
* By default, the status of the mission will be successful and an alert will be displayed.
* Example: ["mymissionID"] call RF_fnc_closeMission;
*
* FR:
* Utilisation: Ferme la mission identifié par le missionID passé en paramètre. 
* Par défaut, le status de la mission sera sur succès et une alerte sera affiché.
* Exemple: ["mymissionID"] call RF_fnc_closeMission;
*/
params ["_missionID", ["_missionStatus", "SUCCEEDED"], ["_missionShowHint", true]];

[_missionID, _missionStatus, _missionShowHint] spawn BIS_fnc_taskSetState;