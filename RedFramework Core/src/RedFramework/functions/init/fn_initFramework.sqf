/*
* Function name / Nom de la fonction: RF_fnc_initFramework
* Author / Auteur: RedBelette
* Since version / Depuis la version: 1.0.0
* Doc URL: http://www.redframework.com/project-detail/core
*
* EN:
* Usage: This is the initialization function of the framework.
* Example: Dont use
*
* FR:
* Utilisation: Ceci est la fonction d'initialisation du framework.
* Exemple: Ne pas utiliser
*/

// Only server
if (!isServer) exitWith {};
diag_log ["RedFramework initialization"];

// Desable saving
enableSaving [false, false];

// Desactivate the voice of playable units
{_x setSpeaker "NoVoice"} forEach playableUnits;

// Compile and include object oriented and hashmap (used by the cronjob registry at least)
call compilefinal preprocessFileLineNumbers "\RedFramework\lib\map\oo_hashmap.sqf";