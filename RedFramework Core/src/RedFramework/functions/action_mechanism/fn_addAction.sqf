/*
* Function name / Nom de la fonction: RF_fnc_actionRegistry
* Author / Auteur: RedBelette
* Since version / Depuis la version: 1.0.0
* Doc URL: http://www.redframework.com/project-detail/core
*
* EN: 
* Usage: The RF_fnc_actionRegistry function needs to be called beforehand to open an action register.
* This function is used to add an action to the register.
* Example: _action = [_condition, _code] call RF_fnc_action; call RF_fnc_actionRegistry; ["myaction", _action] call RF_fnc_addAction;
* 
* FR: 
* Utilisation: La fonction RF_fnc_actionRegistry a besoin d'être appelé au préalable pour ouvrir un registre des actions.
* Cette fonction permet d'ajouter une action au registre.
* Exemple: _action = [_condition, _code] call RF_fnc_action; call RF_fnc_actionRegistry; ["monaction", _action] call RF_fnc_addAction;
*/
params ["_key","_action"];

_actionRegistry = missionNamespace getVariable "actionRegistry";

_verifyKey = ["containsKey", _key] call _actionRegistry;
if (_verifyKey) throw "key already exist";


["Put", [_key, _action]] call _actionRegistry;

_actionConditionRegistryMap = missionNamespace getVariable "actionConditionRegistryMap";

["Put", [_key, triggerStatements _action]] call _actionConditionRegistryMap;