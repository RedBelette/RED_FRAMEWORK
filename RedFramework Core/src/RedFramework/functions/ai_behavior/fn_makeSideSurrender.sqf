/*
* Function name / Nom de la fonction: RF_fnc_makeSideSurrender
* Author / Auteur: RedBelette
* Since version / Depuis la version: 1.0.0
* Doc URL: http://www.redframework.com/project-detail/core
*
* EN:
* Usage: Surrender occurs when the remaining units of the desired faction are below the desired minimum number.
* Example: [east, 10] call RF_fnc_makeSideSurrender;
*
* FR:
* Utilisation: La reddition se déclenche lorsque le nombre d’unités restant de la faction voulue est en dessous du nombre minimum souhaité.
* Exemple: [east, 10] call RF_fnc_makeSideSurrender;
*/

if (!isServer) exitWith {};

params ["_side", "_minTriggerSurrender"];

_sideCount = _side countSide allUnits;

_redition = false;

if (_sideCount < _minTriggerSurrender) then {
	{
		if (side _x == _side) then {
			// The units move out from the vehicle first
			if (!isNull vehicle _x) then {
				moveOut _x;
			};
			// Create the animation
			_x playmove "AmovPercMstpSsurWnonDnon";
			[_x, "AmovPercMstpSsurWnonDnon"] remoteExec ["playMove"];
			// No AI and captive
			_x disableAI "ANIM";
			_x setCaptive true;
		};
	} forEach allUnits;
	_redition = true;
};
// Return if the side surrender
_redition;