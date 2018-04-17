/*
* Function name / Nom de la fonction: RF_fnc_isMissionClosed
* Author / Auteur: RedBelette
* Since version / Depuis la version: 1.0.0
* Doc URL: http://www.redframework.com/project-detail/core
*
* EN:
* Usage: Returns true when the mission is closed.
* Example: ["mymissionID"] call RF_fnc_isMissionClosed;
*
* FR:
* Utilisation: Retourne vrai lorsque la mission est fermée.
* Exemple: ["mymissionID"] call RF_fnc_isMissionClosed;
*/
params ["_missionID"];

// get the mission state
_type = [_missionID] call RF_fnc_missionState;

// the mission is close when it's succeeded, failed or canceled
_isMissionClosed = false;
if (_type == 'Succeeded' or _type == 'Failed' or _type == 'Canceled') then {
	_isMissionClosed = true;
};

// return true when mission closed
_isMissionClosed
