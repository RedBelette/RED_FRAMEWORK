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

{

	// this scope is executed for solo player
	_x moveInCargo _vehicle;

	//this scope will be remote executed for all given players
	[[_vehicle, _x],{
		Params ["_vehicle","_entityToMove"];

		// Counter and max variables used to prevent infinite loop (ex: when no more place into vehicle)
		_max = 1000;
		_counter = 0;
		while { counter < _max and vehicle _entityToMove != _veh} do
		{
			_entityToMove moveInCargo _vehicle;
			_counter = _counter + 1;
		};

	}] RemoteExec ["call", _x,true];
} forEach units _group;
