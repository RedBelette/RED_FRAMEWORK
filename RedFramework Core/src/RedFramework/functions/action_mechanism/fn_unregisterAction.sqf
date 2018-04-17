/*
* Function name / Nom de la fonction: RF_fnc_unregisterAction
* Author / Auteur: RedBelette
* Since version / Depuis la version: 1.0.0
* Doc URL: http://www.redframework.com/project-detail/core
*
* EN: 
* Usage: Remove action from the action register.
* Example: ["myaction"] call RF_fnc_unregisterAction
* 
* FR: 
* Utilisation: Enlève l'action du registre des actions.
* Exemple: ["monaction"] call RF_fnc_unregisterAction
*/

params ["_key"];

// We need calling RF_fnc_actionRegistry and RF_fnc_addAction first
_actionRegistry = missionNamespace getVariable "actionRegistry";

// Check the existence of the key first
_verifyKey = ["containsKey", _key] call _actionRegistry;
if (!_verifyKey) throw "Invalid key"; // and throw error

// Remove the action
["Remove", _key] call _actionRegistry;

_actionConditionRegistryMap = missionNamespace getVariable "actionConditionRegistryMap";
// And condition
["Remove", [_key]] call _actionConditionRegistryMap;