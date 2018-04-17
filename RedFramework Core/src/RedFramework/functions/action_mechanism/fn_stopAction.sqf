/*
* Function name / Nom de la fonction: RF_fnc_stopAction
* Author / Auteur: RedBelette
* Since version / Depuis la version: 1.0.0
* Doc URL: http://www.redframework.com/project-detail/core
*
* EN: 
* Usage: Desactivate the action from the action register.
* Example: ["myaction"] call RF_fnc_stopAction
* 
* FR: 
* Utilisation: Désactive l'action depuis le registre des actions.
* Exemple: ["monaction"] call RF_fnc_stopAction
*/
params ["_key"];

// We need calling RF_fnc_actionRegistry and RF_fnc_addAction first
_trigger = [_key] call RF_fnc_getAction;

// Clear the statements to desactivate the trigger
_statements = ["","",""];

_trigger setTriggerStatements _statements;