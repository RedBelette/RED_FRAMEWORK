/*
* Function name / Nom de la fonction: RF_fnc_spectator
* Author / Auteur: RedBelette
* Script based on Spectator Camera Script - v0.2 created by BearBison
* Originally taken from from here https://forums.bistudio.com/topic/177851-spectate-mode-through-an-object/?p=2793480
* Since version / Depuis la version: 1.0.3
* Doc URL: http://www.redframework.com/project-detail/core
*
* EN:
* Usage:This script will allow you to create the spectator's mode.
* Example: call RF_fnc_spectator;
*
* FR:
* Utilisation: Ce script vous permettra de créer le mode spectateur.
* Exemple: call RF_fnc_spectator;
*/

// Disable simulation for the player
player enableSimulation false;
// Disable post processing effects for spectator
BIS_fnc_feedback_allowPP = false;

// Activate spectator mode for ACRE or TFAR
if (!isNil "acre_api_fnc_isInitialized") then {
	diag_log ["acre spectator's mode activated"];
	[true] call acre_api_fnc_setSpectator;
};
if (!isNil "TFAR_fnc_initialiseBaseModule") then {
	diag_log ["tfar spectator's mode activated"];
	[player, true] call TFAR_fnc_forceSpectator;
};

// Handle event to check the action exitSpect on each frame
["exitSpect", "onEachFrame", {
    if (inputAction "ReloadMagazine" > 0) exitWith { // Check if "Reload" key is pressed
    	// Terminate Spectator instance
        ["Terminate"] call BIS_fnc_EGSpectator;
        // Enable simulation for the player
        player enableSimulation true;
        // Activate spectator mode for ACRE or TFAR
		if (!isNil "acre_api_fnc_isInitialized") then {
			diag_log ["acre spectator's mode activated"];
			[false] call acre_api_fnc_setSpectator;
		};
		if (!isNil "TFAR_fnc_initialiseBaseModule") then {
			diag_log ["tfar spectator's mode activated"];
			[player, false] call TFAR_fnc_forceSpectator;
		};
		// Enable post processing effects for spectator
        BIS_fnc_feedback_allowPP = true;
        // Remove the stackedEventHandler as we no longer need it
        ["exitSpect", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
    };
}] call BIS_fnc_addStackedEventHandler;

// Initialize Spectator instance
["Initialize", [player, [side player], false, true, true, true, true, true, true, true]] call BIS_fnc_EGSpectator;
// Hint (without sound) to say to press RELOAD keybind
hintSilent "Press RELOAD to exit spectator";