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

		// --- CLIENT --- //
		class textCategory {
			file = "\RedFramework\functions\client\text";
			class scenarioTitle {};
		};

		class uiCategory {
			file = "\RedFramework\functions\client\ui";
			class imageFullScreen {};
			class imageInSky {};
			class progressBar {};
		};

		class initClientCategory {
			file = "\RedFramework\functions\client\init";
			class loadingFinished {};
		};

		// --- SERVER --- //
		// init
		class initCategory {
			file = "\RedFramework\functions\server\init";
			class initFramework {
				preInit = 1;
			};
		};
		// ace
		class aceCategory {
			file = "\RedFramework\functions\server\ace";
			class huntirSatellite {};
		};
		// spawn
		class spawnCategory {
			file = "\RedFramework\functions\server\spawn";
			class spawnUnits {};
			class spawnGarnisons {};
			class spawnCirclePatrols {};
		};
		// ia
		class iaCategory {
			file = "\RedFramework\functions\server\ia";
			class sideDefendArea {};
			class reddition {};
			class sendHelicoToFight {};
			class landingHelico {};
			class initHelico {};
		};
		// curator
		class curatorCategory {
			file = "\RedFramework\functions\server\curator";
			class makeAllUnitsEditableForAllCurator {};
			class makeObjectsEditableForAllCurator {};
		};
		// combat patrol
		class combatPatrolCategory {
			file = "\RedFramework\functions\server\combatpatrol";
			class missionGenerator {};
			class createMission {};
			class closeMission {};
			class missionState {};
			class isMissionClosed {};
			class spawnMissionHelicopterCrashInTown {};
		};

		// --- BOTH CLIENT AND SERVER --- //

		// converters
		class converterCategory {
			file = "\RedFramework\functions\both\converter";
			class convertSideStr {};
		};

		// location
		class locationCategory {
			file = "\RedFramework\functions\both\location";
			class locationGenerator {};
			class locations {};
		};

		// actions
		class triggerCategory {
			file = "\RedFramework\functions\both\trigger";
			// classic actions mode
			class action {};
			class delayedAction {};
			class repeatedAction {};
			// managed action mode
			class actionRegistry {};
			class addAction {};
			class getAction {};
			class runAction {};
			class stopAction {};
			class unregisterAction {};
		};

		// search
		class searchCategory {
			file = "\RedFramework\functions\both\search";
			class isPlayerNearEntity {};
			class isInVehicle {};
		};

		// anim
		class animCategory {
			file = "\RedFramework\functions\both\anim";
			class playMoveLoop;
		};
	};
};