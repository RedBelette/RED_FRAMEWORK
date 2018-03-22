if (!isServer) exitWith {};

params ["_position"];

_satelittePosX = _position select 0;
_satelittePosY = _position select 1;
_satelittePosZ = _position select 2;

_satelitte = "ACE_HuntIR" createVehicle [_satelittePosX,_satelittePosY,_satelittePosZ];
_satelitte setPos [_satelittePosX,_satelittePosY,_satelittePosZ];

hideObject _satelitte;
_satelitte allowDamage false;

[_satelitte, _satelittePosX, _satelittePosY, _satelittePosZ] spawn {
	_satelitte = _this select 0;
	_satelittePosX = _this select 1;
	_satelittePosY = _this select 2;
	_satelittePosZ = _this select 3;
	while {true} do {
		_satelitte setVelocityTransformation [
			[_satelittePosX,_satelittePosY,_satelittePosZ],
			[_satelittePosX,_satelittePosY,_satelittePosZ],
			[0,0,0],
			[0,0,0],
			[0,0,0],
			[0,0,0],
			[0,0,0],
			[0,0,0],
			0
		];
		sleep 0.3;
	};
};

_satelitte