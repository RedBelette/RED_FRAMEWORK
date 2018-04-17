/*
* Function name / Nom de la fonction: RF_fnc_isPlayerNearEntity
* Author / Auteur: RedBelette
* Since version / Depuis la version: 1.0.0
* Doc URL: http://www.redframework.com/project-detail/core
*
* EN:
* Usage: Checks if a player is close to an entity following a radius
* Example: [player, 200] call RF_fnc_isPlayerNearEntity;
*
* FR:
* Utilisation: Vérifie si un joueur est proche d'une entité suivant un rayon
* Exemple: [player, 200] call RF_fnc_isPlayerNearEntity;
*/
params ["_entity", "_radius"];

_found = false;
// nearEntities check all entities around entity. An entity is all type of arma objects.
_entities = _entity nearEntities _radius;

{
	// Check if the entity is a player
	if (isPlayer _x) then {
		_found = true;
	};
} forEach _entities;

_found