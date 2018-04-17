/*
* Function name / Nom de la fonction: RF_fnc_actionRegistry
* Author / Auteur: RedBelette
* Since version / Depuis la version: 1.0.0
* Doc URL: http://www.redframework.com/project-detail/core
*
* EN: 
* Usage: This function opens a register of actions, allowing you to start or stop an action.
* Example: call RF_fnc_actionRegistry
* 
* FR: 
* Utilisation: Cette fonction ouvre un registre des actions, permettant par la suite de démarrer ou d'arrêter une action.
* Exemple: call RF_fnc_actionRegistry
*/

_actionRegistryMap = ["new", []] call OO_HASHMAP;

missionNamespace setVariable ["actionRegistry", _actionRegistryMap];

_actionConditionRegistryMap = ["new", []] call OO_HASHMAP;

missionNamespace setVariable ["actionConditionRegistryMap", _actionConditionRegistryMap];