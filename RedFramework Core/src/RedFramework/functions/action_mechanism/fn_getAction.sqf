/*
* Function name / Nom de la fonction: RF_fnc_huntirSatellite
* Author / Auteur: RedBelette
* Since version / Depuis la version: 1.0.0
* Doc URL: http://www.redframework.com/project-detail/core
*
* EN: 
* Usage: This function allows you to find an action in the action register.
* The key corresponds to the one introduced with the RF_fnc_addAction; function
* Example: _action = ["myaction"] call RF_fnc_getAction; 
* 
* FR: 
* Utilisation: Cette fonction permet de retrouver une action dans le registre des actions.
* La clé correspond a celle introduite avec la fonction RF_fnc_addAction;
* Exemple: _action = ["monaction"] call RF_fnc_getAction; 
*/
params ["_key"];

// We need calling RF_fnc_actionRegistry first
_actionRegistry = missionNamespace getVariable "actionRegistry";

// Check the existence of the key first
_verifyKey = ["containsKey", _key] call _actionRegistry;
if (!_verifyKey) throw "Invalid key"; // and throw error

// Retrieve the action
_action = ["Get", _key] call _actionRegistry;

// And return this one.
_action