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

diag_log ["enter moveInCargo", _group, _vehicle];

[_vehicle, _group] spawn {
	params["_vehicle", "_group"];
	
	_vehicleOwner = owner _vehicle;
	_vehicle setOwner 2;
	{    
		if (local _x) then { 
			_x moveInCargo _vehicle; 
		} else { 
			_owner = owner _x; 
			_x setOwner 2; 
			waitUntil {local _x}; 
			_x moveInCargo _vehicle; 
			_x setOwner _owner; 
		}; 
	} forEach units _group; 
	_vehicle setOwner _vehicleOwner;
};

