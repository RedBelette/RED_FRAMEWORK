/*
* Function name / Nom de la fonction: RF_fnc_moveInCargo
* Author / Auteur: MRH
* Since version / Depuis la version: 1.0.0
* Doc URL: http://www.redframework.com/project-detail/core
*
* EN:
* Usage: Charge a group of players in the cargo of a vehicle. The basic moveInCargo instruction is defective in MP.
* Example: [_group, _vehicle] call RF_fnc_moveInCargo;
*
* FR:
* Utilisation: Charge un groupe de joueur dans le cargo d'un vehicule. L'instruction moveInCargo de base est défectueuse en MP.
* Exemple: [_group, _vehicle] call RF_fnc_moveInCargo;
*/
Params ["_group", "_vehicle"];

// for solo
if (isServer && hasInterface) then {
	{
		_x moveInCargo _vehicle;
	} forEach units _group;
};

// for MP
if (isDedicated) then {

	// Share the reference of the vehicle
	_handle = [_vehicle] spawn {
		params ["_vehicle"];
		RF_var_moveInCargo = _vehicle;
		publicVariable "RF_var_moveInCargo";
	};
	waitUntil {scriptDone _handle};

	// Move
	[_group, RF_var_moveInCargo] spawn {
		params ["_group", "_vehicle"];
		sleep 2;
		{
			_entityToMove = _x;
			[[_entityToMove, _vehicle], {
				params ["_entityToMove", "_vehicle"];
				_entityToMove moveInCargo _vehicle;
			}] remoteExec ["call", _x];
		} forEach units _group;
	};
};
