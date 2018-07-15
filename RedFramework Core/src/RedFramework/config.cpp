class CfgPatches {
	class RedFramework {
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {};
	};
};

class CfgFunctions {
	class RF {

		class aceImprovements {
			file = "\RedFramework\functions\ace_improvements";
			class huntirSatellite {};
		};

		class actionMechanism {
			file = "\RedFramework\functions\action_mechanism";
			class action {};
			class remoteAction {};
			class actionRegistry {};
			class addAction {};
			class delayedAction {};
			class remoteDelayedAction {};
			class getAction {};
			class repeatedAction {};
			class remoteRepeatedAction {};
			class runAction {};
			class stopAction {};
			class unregisterAction {};
		};

		class aiBehavior {
			file = "\RedFramework\functions\ai_behavior";
			class makeSideSurrender {};
			class sideDefendArea {};
		};

		class ambience {
			file = "\RedFramework\functions\ambience";
			class lightningBolt {};
		};

		class animation {
			file = "\RedFramework\functions\animation";
			class playMoveLoop {};
		};

		class condition {
			file = "\RedFramework\functions\condition";
			class isInVehicle {};
			class isPlayerNearEntity {};
		};

		class converter {
			file = "\RedFramework\functions\converter";
			class convertSideStr {};
		};

		class heliControl {
			file = "\RedFramework\functions\heli_control";
			class heliInit {};
			class landHeli {};
			class sendHeliToFight {};
			class unloadUnitsWithHeli {};
		};

		class init {
			file = "\RedFramework\functions\init";
			class initFramework {
				preInit = 1;
			};
			class missionCfg {
				postInit = 1;
			};
			class loadingComplete {};
		};

		class missionGenerator {
			file = "\RedFramework\functions\mission_generator";
			class closeMission {};
			class createMission {};
			class isMissionClosed {};
			class locationGenerator {};
			class locations {};
			class missionGenerator {};
			class missionState {};
			class spawnMissionHelicopterCrashInTown {};
		};

		class spawn {
			file = "\RedFramework\functions\spawn";
			class spawnByHeli {};
			class spawnCirclePatrols {};
			class spawnGarrison {};
			class spawnUnits {};
		}

		class spectator {
			file = "\RedFramework\functions\spectator";
			class spectator {};
			class addSpectatorAction {};
		}

		class ui {
			file = "\RedFramework\functions\ui";
			class imageFullScreen {};
			class imageInSky {};
			class progressBar {};
			class scenarioTitle {};
		}

		class vehicle {
			file = "\RedFramework\functions\vehicle";
			class moveInCargo {};
		}

		class zeus {
			file = "\RedFramework\functions\zeus";
			class makeAllUnitsEditableForAllCurators {};
			class makeObjectsEditableForAllCurators {};
		};

		class layer {
			file = "\RedFramework\functions\layer";
			class disableLayer {};
			class enableLayer {};
		};

		class zSpawner {
			file = "\RedFramework\functions\zombie";
			class zSpawner {};
		};
	};
};