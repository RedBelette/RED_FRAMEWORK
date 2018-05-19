/*
* Function name / Nom de la fonction: RF_fnc_missionCfg
* Author / Auteur: RedBelette
* Since version / Depuis la version: 1.0.0
* Doc URL: http://www.redframework.com/project-detail/core
*
* EN:
* Usage: This is the initialization function of the mission.
* Example: Dont use
*
* FR:
* Utilisation: Ceci est la fonction d'initialisation de la mission.
* Exemple: Ne pas utiliser
*/

// Only server
if (!isServer) exitWith {};
diag_log ["RedFramework mission initialization"];


// Add item earplugs in inventory
_addItemEarPlugs = (getMissionConfig "RedFrameworkConfig" >> "missionCfg" >> "addItemEarplugs") call  BIS_fnc_returnConfigEntry;

if (!(isNil "_addItemEarPlugs")) then {
	if (_addItemEarPlugs == true) then {
		{
			_x addItem "ACE_EarPlugs";
		} forEach playableUnits;
	};
};

// Put in the earplugs
_putInEarplugs = (getMissionConfig "RedFrameworkConfig" >> "missionCfg" >> "putInEarplugs") call  BIS_fnc_returnConfigEntry;

if (!(isNil "_putInEarplugs")) then {
	if (_putInEarplugs == "true") then {
		{
			if ("ACE_EarPlugs" in items player) then {
				[player] call ace_hearing_fnc_putInEarPlugs;
			};
		} remoteExec ["call", 0, true];
	};
};

// Put weapon security
_putSafeMode = (getMissionConfig "RedFrameworkConfig" >> "missionCfg" >> "putSafeMode") call  BIS_fnc_returnConfigEntry;

if (!(isNil "_putSafeMode")) then {
	if (_putSafeMode == "true") then {
		{
			if (currentWeapon player != "") then {
				[player, currentWeapon player, currentMuzzle player] call ace_safemode_fnc_lockSafety;
			};
		} remoteExec ["call", 0, true];
	};
};
