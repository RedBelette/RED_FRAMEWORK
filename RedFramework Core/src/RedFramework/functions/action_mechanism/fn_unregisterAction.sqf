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

_actionRegistry = missionNamespace getVariable "actionRegistry";

_verifyKey = ["containsKey", _key] call _actionRegistry;
if (!_verifyKey) throw "Invalid key";

["Remove", _key] call _actionRegistry;

_actionConditionRegistryMap = missionNamespace getVariable "actionConditionRegistryMap";

["Remove", [_key]] call _actionConditionRegistryMap;