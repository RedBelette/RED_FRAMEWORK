/*
* Function name / Nom de la fonction: RF_fnc_lightningBolt
* Author / Auteur: RedBelette
* Since version / Depuis la version: 1.0.3
* Doc URL: http://www.redframework.com/project-detail/core
*
* EN:
* Usage: Flash on the desired area. The default value of the delay is 0.
* Example: [_position, _delay] call RF_fnc_lightningBolt
*
* FR:
* Utilisation: Lance un éclair sur la zone désiré. La valeur par défaut du délai est 0.
* Exemple: [_position, _delay] call RF_fnc_lightningBolt;
*/

params ["_pos", ["_delay", 0]];

[_pos, _delay] spawn {

	params ["_pos", "_delay"];

	sleep _delay;
	_bolt = createvehicle ["LightningBolt", _pos,[],0,"CAN_COLLIDE"];
	_bolt setposatl _pos;
	_bolt setdamage 1;

	[
		[_pos],
		{
			params ["_pos"];
			[_pos] spawn {
				params ["_pos"];

				_light = "#lightpoint" createvehiclelocal _pos;
				_light setposatl [_pos select 0,_pos select 1,(_pos select 2) + 10];
				_light setLightDayLight true;
				_light setLightBrightness 300;
				_light setLightAmbient [0.05, 0.05, 0.1];
				_light setlightcolor [1, 1, 2];

				sleep 0.1;
				_light setLightBrightness 0;
				sleep (random 0.1);

				_class = ["lightning1_F","lightning2_F"] call bis_Fnc_selectrandom;
				_lightning = _class createvehiclelocal [100,100,100];
				_lightning setdir random 360;
				_lightning setpos _pos;

				deletevehicle _lightning;
				deletevehicle _light;

				0 setlightnings 0;
			};
		}
	] remoteExec ["call", 0];

};