/*
* Function name / Nom de la fonction: RF_fnc_zSpawner
* Author / Auteur: RedBelette
* Since version / Depuis la version: 1.0.3
* Doc URL: http://www.redframework.com/project-detail/core
* EXTERNAL MOD REQUIRED: Zombies and Demons
*
* EN:
* Usage: The mod zombie Ryan's spawner module seems to pose performance
* concerns in MP so here is a spawner optimize.
* Example: [_side, _gameLogic, _numberByWave, _time, _type] call RF_fnc_zSpawner
*
* FR:
* Utilisation: Le module de spawner du mod Ryan zombie semble poser des
* soucis de performance en MP alors voici un spawner optimiser.
* Exemple: [_side, _gameLogic, _numberByWave, _time, _type] call RF_fnc_zSpawner
*
* Parameters
* side: west, east, ...
* gameLogic: gameLogic module
* numberByWave: number of Z max spawned by wave.
* time: delay between wave
* type: (default: mediumCivilian)
* - fastCivilian
* - fastSoldier
* - fastCivilianAndSoldier
* - mediumCivilian
* - mediumSoldier
* - mediumCivilianAndSoldier
* - slowCivilian
* - slowSoldier
* - slowCivilianAndSoldier
* - walkerCivilian
* - walkerSoldier
* - walkerCivilianAndSoldier
* - demon
* - spider
* - brittleCrawler
* - mixedZombie
* - mixedZombieNoSpiderNoCrawler
*/
params ["_side", "_gameLogic", "_numberByWave", "_time", ["_type", "mediumCivilian"]];

_gameLogic setVariable ["_side", _side];
_gameLogic setVariable ["_alive", _numberByWave];
_gameLogic setVariable ["_numberByWave", _numberByWave];
_gameLogic setVariable ["_type", _type];
_gameLogic setVariable ["_time", _time];

_fastCivilian = ["RyanZombieC_man_1", "RyanZombieC_man_polo_1_F", "RyanZombieC_man_polo_2_F", "RyanZombieC_man_polo_4_F", "RyanZombieC_man_polo_5_F", "RyanZombieC_man_polo_6_F", "RyanZombieC_man_p_fugitive_F", "RyanZombieC_man_w_worker_F", "RyanZombieC_scientist_F", "RyanZombieC_man_hunter_1_F", "RyanZombieC_man_pilot_F", "RyanZombieC_journalist_F", "RyanZombieC_Orestes", "RyanZombieC_Nikos", "RyanZombie15", "RyanZombie16", "RyanZombie17", "RyanZombie18", "RyanZombie19", "RyanZombie20", "RyanZombie21", "RyanZombie22", "RyanZombie23", "RyanZombie24", "RyanZombie25", "RyanZombie26", "RyanZombie27", "RyanZombie28", "RyanZombie29", "RyanZombie30", "RyanZombie31", "RyanZombie32"];
_fastSoldier = ["RyanZombieB_Soldier_02_f", "RyanZombieB_Soldier_02_f_1", "RyanZombieB_Soldier_02_f_1_1", "RyanZombieB_Soldier_03_f", "RyanZombieB_Soldier_03_f_1", "RyanZombieB_Soldier_03_f_1_1", "RyanZombieB_Soldier_04_f", "RyanZombieB_Soldier_04_f_1", "RyanZombieB_Soldier_04_f_1_1", "RyanZombieB_Soldier_lite_F", "RyanZombieB_Soldier_lite_F_1"];
_fastCivilianAndSoldier = ["RyanZombieC_man_1", "RyanZombieC_man_polo_1_F", "RyanZombieC_man_polo_2_F", "RyanZombieC_man_polo_4_F", "RyanZombieC_man_polo_5_F", "RyanZombieC_man_polo_6_F", "RyanZombieC_man_p_fugitive_F", "RyanZombieC_man_w_worker_F", "RyanZombieC_scientist_F", "RyanZombieC_man_hunter_1_F", "RyanZombieC_man_pilot_F", "RyanZombieC_journalist_F", "RyanZombieC_Orestes", "RyanZombieC_Nikos", "RyanZombie15", "RyanZombie16", "RyanZombie17", "RyanZombie18", "RyanZombie19", "RyanZombie20", "RyanZombie21", "RyanZombie22", "RyanZombie23", "RyanZombie24", "RyanZombie25", "RyanZombie26", "RyanZombie27", "RyanZombie28", "RyanZombie29", "RyanZombie30", "RyanZombie31", "RyanZombie32", "RyanZombieB_Soldier_02_f", "RyanZombieB_Soldier_02_f_1", "RyanZombieB_Soldier_02_f_1_1", "RyanZombieB_Soldier_03_f", "RyanZombieB_Soldier_03_f_1", "RyanZombieB_Soldier_03_f_1_1", "RyanZombieB_Soldier_04_f", "RyanZombieB_Soldier_04_f_1", "RyanZombieB_Soldier_04_f_1_1", "RyanZombieB_Soldier_lite_F", "RyanZombieB_Soldier_lite_F_1"];
_mediumCivilian = ["RyanZombieC_man_1medium", "RyanZombieC_man_polo_1_Fmedium", "RyanZombieC_man_polo_2_Fmedium", "RyanZombieC_man_polo_4_Fmedium", "RyanZombieC_man_polo_5_Fmedium", "RyanZombieC_man_polo_6_Fmedium", "RyanZombieC_man_p_fugitive_Fmedium", "RyanZombieC_man_w_worker_Fmedium", "RyanZombieC_scientist_Fmedium", "RyanZombieC_man_hunter_1_Fmedium", "RyanZombieC_man_pilot_Fmedium", "RyanZombieC_journalist_Fmedium", "RyanZombieC_Orestesmedium", "RyanZombieC_Nikosmedium", "RyanZombie15medium", "RyanZombie16medium", "RyanZombie17medium", "RyanZombie18medium", "RyanZombie19medium", "RyanZombie20medium", "RyanZombie21medium", "RyanZombie22medium", "RyanZombie23medium", "RyanZombie24medium", "RyanZombie25medium", "RyanZombie26medium", "RyanZombie27medium", "RyanZombie28medium", "RyanZombie29medium", "RyanZombie30medium", "RyanZombie31medium", "RyanZombie32medium"];
_mediumSoldier = ["RyanZombieB_Soldier_02_fmedium", "RyanZombieB_Soldier_02_f_1medium", "RyanZombieB_Soldier_02_f_1_1medium", "RyanZombieB_Soldier_03_fmedium", "RyanZombieB_Soldier_03_f_1medium", "RyanZombieB_Soldier_03_f_1_1medium", "RyanZombieB_Soldier_04_fmedium", "RyanZombieB_Soldier_04_f_1medium", "RyanZombieB_Soldier_04_f_1_1medium", "RyanZombieB_Soldier_lite_Fmedium", "RyanZombieB_Soldier_lite_F_1medium"];
_mediumSoldierAndCivilian = ["RyanZombieC_man_1medium", "RyanZombieC_man_polo_1_Fmedium", "RyanZombieC_man_polo_2_Fmedium", "RyanZombieC_man_polo_4_Fmedium", "RyanZombieC_man_polo_5_Fmedium", "RyanZombieC_man_polo_6_Fmedium", "RyanZombieC_man_p_fugitive_Fmedium", "RyanZombieC_man_w_worker_Fmedium", "RyanZombieC_scientist_Fmedium", "RyanZombieC_man_hunter_1_Fmedium", "RyanZombieC_man_pilot_Fmedium", "RyanZombieC_journalist_Fmedium", "RyanZombieC_Orestesmedium", "RyanZombieC_Nikosmedium", "RyanZombie15medium", "RyanZombie16medium", "RyanZombie17medium", "RyanZombie18medium", "RyanZombie19medium", "RyanZombie20medium", "RyanZombie21medium", "RyanZombie22medium", "RyanZombie23medium", "RyanZombie24medium", "RyanZombie25medium", "RyanZombie26medium", "RyanZombie27medium", "RyanZombie28medium", "RyanZombie29medium", "RyanZombie30medium", "RyanZombie31medium", "RyanZombie32medium", "RyanZombieB_Soldier_02_fmedium", "RyanZombieB_Soldier_02_f_1medium", "RyanZombieB_Soldier_02_f_1_1medium", "RyanZombieB_Soldier_03_fmedium", "RyanZombieB_Soldier_03_f_1medium", "RyanZombieB_Soldier_03_f_1_1medium", "RyanZombieB_Soldier_04_fmedium", "RyanZombieB_Soldier_04_f_1medium", "RyanZombieB_Soldier_04_f_1_1medium", "RyanZombieB_Soldier_lite_Fmedium", "RyanZombieB_Soldier_lite_F_1medium"];
_slowCivilian = ["RyanZombieC_man_1slow", "RyanZombieC_man_polo_1_Fslow", "RyanZombieC_man_polo_2_Fslow", "RyanZombieC_man_polo_4_Fslow", "RyanZombieC_man_polo_5_Fslow", "RyanZombieC_man_polo_6_Fslow", "RyanZombieC_man_p_fugitive_Fslow", "RyanZombieC_man_w_worker_Fslow", "RyanZombieC_scientist_Fslow", "RyanZombieC_man_hunter_1_Fslow", "RyanZombieC_man_pilot_Fslow", "RyanZombieC_journalist_Fslow", "RyanZombieC_Orestesslow", "RyanZombieC_Nikosslow", "RyanZombie15slow", "RyanZombie16slow", "RyanZombie17slow", "RyanZombie18slow", "RyanZombie19slow", "RyanZombie20slow", "RyanZombie21slow", "RyanZombie22slow", "RyanZombie23slow", "RyanZombie24slow", "RyanZombie25slow", "RyanZombie26slow", "RyanZombie27slow", "RyanZombie28slow", "RyanZombie29slow", "RyanZombie30slow", "RyanZombie31slow", "RyanZombie32slow"];
_slowSoldier = ["RyanZombieB_Soldier_02_fslow", "RyanZombieB_Soldier_02_f_1slow", "RyanZombieB_Soldier_02_f_1_1slow", "RyanZombieB_Soldier_03_fslow", "RyanZombieB_Soldier_03_f_1slow", "RyanZombieB_Soldier_03_f_1_1slow", "RyanZombieB_Soldier_04_fslow", "RyanZombieB_Soldier_04_f_1slow", "RyanZombieB_Soldier_04_f_1_1slow", "RyanZombieB_Soldier_lite_Fslow", "RyanZombieB_Soldier_lite_F_1slow"];
_slowSoldierAndCivilian = ["RyanZombieC_man_1slow", "RyanZombieC_man_polo_1_Fslow", "RyanZombieC_man_polo_2_Fslow", "RyanZombieC_man_polo_4_Fslow", "RyanZombieC_man_polo_5_Fslow", "RyanZombieC_man_polo_6_Fslow", "RyanZombieC_man_p_fugitive_Fslow", "RyanZombieC_man_w_worker_Fslow", "RyanZombieC_scientist_Fslow", "RyanZombieC_man_hunter_1_Fslow", "RyanZombieC_man_pilot_Fslow", "RyanZombieC_journalist_Fslow", "RyanZombieC_Orestesslow", "RyanZombieC_Nikosslow", "RyanZombie15slow", "RyanZombie16slow", "RyanZombie17slow", "RyanZombie18slow", "RyanZombie19slow", "RyanZombie20slow", "RyanZombie21slow", "RyanZombie22slow", "RyanZombie23slow", "RyanZombie24slow", "RyanZombie25slow", "RyanZombie26slow", "RyanZombie27slow", "RyanZombie28slow", "RyanZombie29slow", "RyanZombie30slow", "RyanZombie31slow", "RyanZombie32slow", "RyanZombieB_Soldier_02_fslow", "RyanZombieB_Soldier_02_f_1slow", "RyanZombieB_Soldier_02_f_1_1slow", "RyanZombieB_Soldier_03_fslow", "RyanZombieB_Soldier_03_f_1slow", "RyanZombieB_Soldier_03_f_1_1slow", "RyanZombieB_Soldier_04_fslow", "RyanZombieB_Soldier_04_f_1slow", "RyanZombieB_Soldier_04_f_1_1slow", "RyanZombieB_Soldier_lite_Fslow", "RyanZombieB_Soldier_lite_F_1slow"];
_walkerCivilian = ["RyanZombieC_man_1Walker", "RyanZombieC_man_polo_1_FWalker", "RyanZombieC_man_polo_2_FWalker", "RyanZombieC_man_polo_4_FWalker", "RyanZombieC_man_polo_5_FWalker", "RyanZombieC_man_polo_6_FWalker", "RyanZombieC_man_p_fugitive_FWalker", "RyanZombieC_man_w_worker_FWalker", "RyanZombieC_scientist_FWalker", "RyanZombieC_man_hunter_1_FWalker", "RyanZombieC_man_pilot_FWalker", "RyanZombieC_journalist_FWalker", "RyanZombieC_OrestesWalker", "RyanZombieC_NikosWalker", "RyanZombie15walker", "RyanZombie16walker", "RyanZombie17walker", "RyanZombie18walker", "RyanZombie19walker", "RyanZombie20walker", "RyanZombie21walker", "RyanZombie22walker", "RyanZombie23walker", "RyanZombie24walker", "RyanZombie25walker", "RyanZombie26walker", "RyanZombie27walker", "RyanZombie28walker", "RyanZombie29walker", "RyanZombie30walker", "RyanZombie31walker", "RyanZombie32walker"];
_walkerSoldier = ["RyanZombieB_Soldier_02_fWalker", "RyanZombieB_Soldier_02_f_1Walker", "RyanZombieB_Soldier_02_f_1_1Walker", "RyanZombieB_Soldier_03_fWalker", "RyanZombieB_Soldier_03_f_1Walker", "RyanZombieB_Soldier_03_f_1_1Walker", "RyanZombieB_Soldier_04_fWalker", "RyanZombieB_Soldier_04_f_1Walker", "RyanZombieB_Soldier_04_f_1_1Walker", "RyanZombieB_Soldier_lite_FWalker", "RyanZombieB_Soldier_lite_F_1Walker"];
_walkerSoldierAndCivilian = ["RyanZombieC_man_1Walker", "RyanZombieC_man_polo_1_FWalker", "RyanZombieC_man_polo_2_FWalker", "RyanZombieC_man_polo_4_FWalker", "RyanZombieC_man_polo_5_FWalker", "RyanZombieC_man_polo_6_FWalker", "RyanZombieC_man_p_fugitive_FWalker", "RyanZombieC_man_w_worker_FWalker", "RyanZombieC_scientist_FWalker", "RyanZombieC_man_hunter_1_FWalker", "RyanZombieC_man_pilot_FWalker", "RyanZombieC_journalist_FWalker", "RyanZombieC_OrestesWalker", "RyanZombieC_NikosWalker", "RyanZombie15walker", "RyanZombie16walker", "RyanZombie17walker", "RyanZombie18walker", "RyanZombie19walker", "RyanZombie20walker", "RyanZombie21walker", "RyanZombie22walker", "RyanZombie23walker", "RyanZombie24walker", "RyanZombie25walker", "RyanZombie26walker", "RyanZombie27walker", "RyanZombie28walker", "RyanZombie29walker", "RyanZombie30walker", "RyanZombie31walker", "RyanZombie32walker", "RyanZombieB_Soldier_02_fWalker", "RyanZombieB_Soldier_02_f_1Walker", "RyanZombieB_Soldier_02_f_1_1Walker", "RyanZombieB_Soldier_03_fWalker", "RyanZombieB_Soldier_03_f_1Walker", "RyanZombieB_Soldier_03_f_1_1Walker", "RyanZombieB_Soldier_04_fWalker", "RyanZombieB_Soldier_04_f_1Walker", "RyanZombieB_Soldier_04_f_1_1Walker", "RyanZombieB_Soldier_lite_FWalker", "RyanZombieB_Soldier_lite_F_1Walker"];
_demon = ["RyanZombieboss1", "RyanZombieboss2", "RyanZombieboss3", "RyanZombieboss4", "RyanZombieboss5", "RyanZombieboss6", "RyanZombieboss7", "RyanZombieboss8", "RyanZombieboss9", "RyanZombieboss10", "RyanZombieboss11", "RyanZombieboss12", "RyanZombieboss13", "RyanZombieboss14", "RyanZombieboss15", "RyanZombieboss16", "RyanZombieboss17", "RyanZombieboss18", "RyanZombieboss19", "RyanZombieboss20", "RyanZombieboss21", "RyanZombieboss22", "RyanZombieboss23", "RyanZombieboss24", "RyanZombieboss25", "RyanZombieboss26", "RyanZombieboss27", "RyanZombieboss28", "RyanZombieboss29", "RyanZombieboss30", "RyanZombieboss31", "RyanZombieboss32"];
_spider = ["RyanZombieSpider1", "RyanZombieSpider2", "RyanZombieSpider3", "RyanZombieSpider4", "RyanZombieSpider5", "RyanZombieSpider6", "RyanZombieSpider7", "RyanZombieSpider8", "RyanZombieSpider9", "RyanZombieSpider10", "RyanZombieSpider11", "RyanZombieSpider12", "RyanZombieSpider13", "RyanZombieSpider14", "RyanZombieSpider15", "RyanZombieSpider16", "RyanZombieSpider17", "RyanZombieSpider18", "RyanZombieSpider19", "RyanZombieSpider20", "RyanZombieSpider21", "RyanZombieSpider22", "RyanZombieSpider23", "RyanZombieSpider24", "RyanZombieSpider25", "RyanZombieSpider26", "RyanZombieSpider27", "RyanZombieSpider28", "RyanZombieSpider29", "RyanZombieSpider30", "RyanZombieSpider31", "RyanZombieSpider32"];
_brittleCrawler = ["RyanZombieCrawler1", "RyanZombieCrawler2", "RyanZombieCrawler3", "RyanZombieCrawler4", "RyanZombieCrawler5", "RyanZombieCrawler6", "RyanZombieCrawler7", "RyanZombieCrawler8", "RyanZombieCrawler9", "RyanZombieCrawler10", "RyanZombieCrawler11", "RyanZombieCrawler12", "RyanZombieCrawler13", "RyanZombieCrawler14", "RyanZombieCrawler15", "RyanZombieCrawler16", "RyanZombieCrawler17", "RyanZombieCrawler18", "RyanZombieCrawler19", "RyanZombieCrawler20", "RyanZombieCrawler21", "RyanZombieCrawler22", "RyanZombieCrawler23", "RyanZombieCrawler24", "RyanZombieCrawler25", "RyanZombieCrawler26", "RyanZombieCrawler27", "RyanZombieCrawler28", "RyanZombieCrawler29", "RyanZombieCrawler30", "RyanZombieCrawler31", "RyanZombieCrawler32"];
_mixedZombie = ["RyanZombieC_man_1", "RyanZombieC_man_polo_1_F", "RyanZombieC_man_polo_2_F", "RyanZombieC_man_polo_4_F", "RyanZombieC_man_polo_5_F", "RyanZombieC_man_polo_6_F", "RyanZombieC_man_p_fugitive_F", "RyanZombieC_man_w_worker_F", "RyanZombieC_scientist_F", "RyanZombieC_man_hunter_1_F", "RyanZombieC_man_pilot_F", "RyanZombieC_journalist_F", "RyanZombieC_Orestes", "RyanZombieC_Nikos", "RyanZombie15", "RyanZombie16", "RyanZombie17", "RyanZombie18", "RyanZombie19", "RyanZombie20", "RyanZombie21", "RyanZombie22", "RyanZombie23", "RyanZombie24", "RyanZombie25", "RyanZombie26", "RyanZombie27", "RyanZombie28", "RyanZombie29", "RyanZombie30", "RyanZombie31", "RyanZombie32", "RyanZombieB_Soldier_02_f", "RyanZombieB_Soldier_02_f_1", "RyanZombieB_Soldier_02_f_1_1", "RyanZombieB_Soldier_03_f", "RyanZombieB_Soldier_03_f_1", "RyanZombieB_Soldier_03_f_1_1", "RyanZombieB_Soldier_04_f", "RyanZombieB_Soldier_04_f_1", "RyanZombieB_Soldier_04_f_1_1", "RyanZombieB_Soldier_lite_F", "RyanZombieB_Soldier_lite_F_1", "RyanZombieC_man_1medium", "RyanZombieC_man_polo_1_Fmedium", "RyanZombieC_man_polo_2_Fmedium", "RyanZombieC_man_polo_4_Fmedium", "RyanZombieC_man_polo_5_Fmedium", "RyanZombieC_man_polo_6_Fmedium", "RyanZombieC_man_p_fugitive_Fmedium", "RyanZombieC_man_w_worker_Fmedium", "RyanZombieC_scientist_Fmedium", "RyanZombieC_man_hunter_1_Fmedium", "RyanZombieC_man_pilot_Fmedium", "RyanZombieC_journalist_Fmedium", "RyanZombieC_Orestesmedium", "RyanZombieC_Nikosmedium", "RyanZombie15medium", "RyanZombie16medium", "RyanZombie17medium", "RyanZombie18medium", "RyanZombie19medium", "RyanZombie20medium", "RyanZombie21medium", "RyanZombie22medium", "RyanZombie23medium", "RyanZombie24medium", "RyanZombie25medium", "RyanZombie26medium", "RyanZombie27medium", "RyanZombie28medium", "RyanZombie29medium", "RyanZombie30medium", "RyanZombie31medium", "RyanZombie32medium", "RyanZombieB_Soldier_02_fmedium", "RyanZombieB_Soldier_02_f_1medium", "RyanZombieB_Soldier_02_f_1_1medium", "RyanZombieB_Soldier_03_fmedium", "RyanZombieB_Soldier_03_f_1medium", "RyanZombieB_Soldier_03_f_1_1medium", "RyanZombieB_Soldier_04_fmedium", "RyanZombieB_Soldier_04_f_1medium", "RyanZombieB_Soldier_04_f_1_1medium", "RyanZombieB_Soldier_lite_Fmedium", "RyanZombieB_Soldier_lite_F_1medium", "RyanZombieC_man_1slow", "RyanZombieC_man_polo_1_Fslow", "RyanZombieC_man_polo_2_Fslow", "RyanZombieC_man_polo_4_Fslow", "RyanZombieC_man_polo_5_Fslow", "RyanZombieC_man_polo_6_Fslow", "RyanZombieC_man_p_fugitive_Fslow", "RyanZombieC_man_w_worker_Fslow", "RyanZombieC_scientist_Fslow", "RyanZombieC_man_hunter_1_Fslow", "RyanZombieC_man_pilot_Fslow", "RyanZombieC_journalist_Fslow", "RyanZombieC_Orestesslow", "RyanZombieC_Nikosslow", "RyanZombie15slow", "RyanZombie16slow", "RyanZombie17slow", "RyanZombie18slow", "RyanZombie19slow", "RyanZombie20slow", "RyanZombie21slow", "RyanZombie22slow", "RyanZombie23slow", "RyanZombie24slow", "RyanZombie25slow", "RyanZombie26slow", "RyanZombie27slow", "RyanZombie28slow", "RyanZombie29slow", "RyanZombie30slow", "RyanZombie31slow", "RyanZombie32slow", "RyanZombieB_Soldier_02_fslow", "RyanZombieB_Soldier_02_f_1slow", "RyanZombieB_Soldier_02_f_1_1slow", "RyanZombieB_Soldier_03_fslow", "RyanZombieB_Soldier_03_f_1slow", "RyanZombieB_Soldier_03_f_1_1slow", "RyanZombieB_Soldier_04_fslow", "RyanZombieB_Soldier_04_f_1slow", "RyanZombieB_Soldier_04_f_1_1slow", "RyanZombieB_Soldier_lite_Fslow", "RyanZombieB_Soldier_lite_F_1slow", "RyanZombieC_man_1Walker", "RyanZombieC_man_polo_1_FWalker", "RyanZombieC_man_polo_2_FWalker", "RyanZombieC_man_polo_4_FWalker", "RyanZombieC_man_polo_5_FWalker", "RyanZombieC_man_polo_6_FWalker", "RyanZombieC_man_p_fugitive_FWalker", "RyanZombieC_man_w_worker_FWalker", "RyanZombieC_scientist_FWalker", "RyanZombieC_man_hunter_1_FWalker", "RyanZombieC_man_pilot_FWalker", "RyanZombieC_journalist_FWalker", "RyanZombieC_OrestesWalker", "RyanZombieC_NikosWalker", "RyanZombie15walker", "RyanZombie16walker", "RyanZombie17walker", "RyanZombie18walker", "RyanZombie19walker", "RyanZombie20walker", "RyanZombie21walker", "RyanZombie22walker", "RyanZombie23walker", "RyanZombie24walker", "RyanZombie25walker", "RyanZombie26walker", "RyanZombie27walker", "RyanZombie28walker", "RyanZombie29walker", "RyanZombie30walker", "RyanZombie31walker", "RyanZombie32walker", "RyanZombieB_Soldier_02_fWalker", "RyanZombieB_Soldier_02_f_1Walker", "RyanZombieB_Soldier_02_f_1_1Walker", "RyanZombieB_Soldier_03_fWalker", "RyanZombieB_Soldier_03_f_1Walker", "RyanZombieB_Soldier_03_f_1_1Walker", "RyanZombieB_Soldier_04_fWalker", "RyanZombieB_Soldier_04_f_1Walker", "RyanZombieB_Soldier_04_f_1_1Walker", "RyanZombieB_Soldier_lite_FWalker", "RyanZombieB_Soldier_lite_F_1Walker", "RyanZombieSpider1", "RyanZombieSpider2", "RyanZombieSpider3", "RyanZombieSpider4", "RyanZombieSpider5", "RyanZombieSpider6", "RyanZombieSpider7", "RyanZombieSpider8", "RyanZombieSpider9", "RyanZombieSpider10", "RyanZombieSpider11", "RyanZombieSpider12", "RyanZombieSpider13", "RyanZombieSpider14", "RyanZombieSpider15", "RyanZombieSpider16", "RyanZombieSpider17", "RyanZombieSpider18", "RyanZombieSpider19", "RyanZombieSpider20", "RyanZombieSpider21", "RyanZombieSpider22", "RyanZombieSpider23", "RyanZombieSpider24", "RyanZombieSpider25", "RyanZombieSpider26", "RyanZombieSpider27", "RyanZombieSpider28", "RyanZombieSpider29", "RyanZombieSpider30", "RyanZombieSpider31", "RyanZombieSpider32", "RyanZombieCrawler1", "RyanZombieCrawler2", "RyanZombieCrawler3", "RyanZombieCrawler4", "RyanZombieCrawler5", "RyanZombieCrawler6", "RyanZombieCrawler7", "RyanZombieCrawler8", "RyanZombieCrawler9", "RyanZombieCrawler10", "RyanZombieCrawler11", "RyanZombieCrawler12", "RyanZombieCrawler13", "RyanZombieCrawler14", "RyanZombieCrawler15", "RyanZombieCrawler16", "RyanZombieCrawler17", "RyanZombieCrawler18", "RyanZombieCrawler19", "RyanZombieCrawler20", "RyanZombieCrawler21", "RyanZombieCrawler22", "RyanZombieCrawler23", "RyanZombieCrawler24", "RyanZombieCrawler25", "RyanZombieCrawler26", "RyanZombieCrawler27", "RyanZombieCrawler28", "RyanZombieCrawler29", "RyanZombieCrawler30", "RyanZombieCrawler31", "RyanZombieCrawler32"];
_mixedZombieNoSpiderNoCrawler = ["RyanZombieC_man_1", "RyanZombieC_man_polo_1_F", "RyanZombieC_man_polo_2_F", "RyanZombieC_man_polo_4_F", "RyanZombieC_man_polo_5_F", "RyanZombieC_man_polo_6_F", "RyanZombieC_man_p_fugitive_F", "RyanZombieC_man_w_worker_F", "RyanZombieC_scientist_F", "RyanZombieC_man_hunter_1_F", "RyanZombieC_man_pilot_F", "RyanZombieC_journalist_F", "RyanZombieC_Orestes", "RyanZombieC_Nikos", "RyanZombie15", "RyanZombie16", "RyanZombie17", "RyanZombie18", "RyanZombie19", "RyanZombie20", "RyanZombie21", "RyanZombie22", "RyanZombie23", "RyanZombie24", "RyanZombie25", "RyanZombie26", "RyanZombie27", "RyanZombie28", "RyanZombie29", "RyanZombie30", "RyanZombie31", "RyanZombie32", "RyanZombieB_Soldier_02_f", "RyanZombieB_Soldier_02_f_1", "RyanZombieB_Soldier_02_f_1_1", "RyanZombieB_Soldier_03_f", "RyanZombieB_Soldier_03_f_1", "RyanZombieB_Soldier_03_f_1_1", "RyanZombieB_Soldier_04_f", "RyanZombieB_Soldier_04_f_1", "RyanZombieB_Soldier_04_f_1_1", "RyanZombieB_Soldier_lite_F", "RyanZombieB_Soldier_lite_F_1", "RyanZombieC_man_1medium", "RyanZombieC_man_polo_1_Fmedium", "RyanZombieC_man_polo_2_Fmedium", "RyanZombieC_man_polo_4_Fmedium", "RyanZombieC_man_polo_5_Fmedium", "RyanZombieC_man_polo_6_Fmedium", "RyanZombieC_man_p_fugitive_Fmedium", "RyanZombieC_man_w_worker_Fmedium", "RyanZombieC_scientist_Fmedium", "RyanZombieC_man_hunter_1_Fmedium", "RyanZombieC_man_pilot_Fmedium", "RyanZombieC_journalist_Fmedium", "RyanZombieC_Orestesmedium", "RyanZombieC_Nikosmedium", "RyanZombie15medium", "RyanZombie16medium", "RyanZombie17medium", "RyanZombie18medium", "RyanZombie19medium", "RyanZombie20medium", "RyanZombie21medium", "RyanZombie22medium", "RyanZombie23medium", "RyanZombie24medium", "RyanZombie25medium", "RyanZombie26medium", "RyanZombie27medium", "RyanZombie28medium", "RyanZombie29medium", "RyanZombie30medium", "RyanZombie31medium", "RyanZombie32medium", "RyanZombieB_Soldier_02_fmedium", "RyanZombieB_Soldier_02_f_1medium", "RyanZombieB_Soldier_02_f_1_1medium", "RyanZombieB_Soldier_03_fmedium", "RyanZombieB_Soldier_03_f_1medium", "RyanZombieB_Soldier_03_f_1_1medium", "RyanZombieB_Soldier_04_fmedium", "RyanZombieB_Soldier_04_f_1medium", "RyanZombieB_Soldier_04_f_1_1medium", "RyanZombieB_Soldier_lite_Fmedium", "RyanZombieB_Soldier_lite_F_1medium", "RyanZombieC_man_1slow", "RyanZombieC_man_polo_1_Fslow", "RyanZombieC_man_polo_2_Fslow", "RyanZombieC_man_polo_4_Fslow", "RyanZombieC_man_polo_5_Fslow", "RyanZombieC_man_polo_6_Fslow", "RyanZombieC_man_p_fugitive_Fslow", "RyanZombieC_man_w_worker_Fslow", "RyanZombieC_scientist_Fslow", "RyanZombieC_man_hunter_1_Fslow", "RyanZombieC_man_pilot_Fslow", "RyanZombieC_journalist_Fslow", "RyanZombieC_Orestesslow", "RyanZombieC_Nikosslow", "RyanZombie15slow", "RyanZombie16slow", "RyanZombie17slow", "RyanZombie18slow", "RyanZombie19slow", "RyanZombie20slow", "RyanZombie21slow", "RyanZombie22slow", "RyanZombie23slow", "RyanZombie24slow", "RyanZombie25slow", "RyanZombie26slow", "RyanZombie27slow", "RyanZombie28slow", "RyanZombie29slow", "RyanZombie30slow", "RyanZombie31slow", "RyanZombie32slow", "RyanZombieB_Soldier_02_fslow", "RyanZombieB_Soldier_02_f_1slow", "RyanZombieB_Soldier_02_f_1_1slow", "RyanZombieB_Soldier_03_fslow", "RyanZombieB_Soldier_03_f_1slow", "RyanZombieB_Soldier_03_f_1_1slow", "RyanZombieB_Soldier_04_fslow", "RyanZombieB_Soldier_04_f_1slow", "RyanZombieB_Soldier_04_f_1_1slow", "RyanZombieB_Soldier_lite_Fslow", "RyanZombieB_Soldier_lite_F_1slow", "RyanZombieC_man_1Walker", "RyanZombieC_man_polo_1_FWalker", "RyanZombieC_man_polo_2_FWalker", "RyanZombieC_man_polo_4_FWalker", "RyanZombieC_man_polo_5_FWalker", "RyanZombieC_man_polo_6_FWalker", "RyanZombieC_man_p_fugitive_FWalker", "RyanZombieC_man_w_worker_FWalker", "RyanZombieC_scientist_FWalker", "RyanZombieC_man_hunter_1_FWalker", "RyanZombieC_man_pilot_FWalker", "RyanZombieC_journalist_FWalker", "RyanZombieC_OrestesWalker", "RyanZombieC_NikosWalker", "RyanZombie15walker", "RyanZombie16walker", "RyanZombie17walker", "RyanZombie18walker", "RyanZombie19walker", "RyanZombie20walker", "RyanZombie21walker", "RyanZombie22walker", "RyanZombie23walker", "RyanZombie24walker", "RyanZombie25walker", "RyanZombie26walker", "RyanZombie27walker", "RyanZombie28walker", "RyanZombie29walker", "RyanZombie30walker", "RyanZombie31walker", "RyanZombie32walker", "RyanZombieB_Soldier_02_fWalker", "RyanZombieB_Soldier_02_f_1Walker", "RyanZombieB_Soldier_02_f_1_1Walker", "RyanZombieB_Soldier_03_fWalker", "RyanZombieB_Soldier_03_f_1Walker", "RyanZombieB_Soldier_03_f_1_1Walker", "RyanZombieB_Soldier_04_fWalker", "RyanZombieB_Soldier_04_f_1Walker", "RyanZombieB_Soldier_04_f_1_1Walker", "RyanZombieB_Soldier_lite_FWalker", "RyanZombieB_Soldier_lite_F_1Walker"];

_array = [];
switch (_type) do
{
	case "fastCivilian":
	{
		_array = _fastCivilian;
	};

	case "fastSoldier":
	{
		_array = _fastSoldier;
	};

	case "fastCivilianAndZombie":
	{
		_array = _fastCivilianAndSoldier;
	};

	case "mediumCivilian":
	{
		_array = _mediumCivilian;
	};

	case "mediumSoldier":
	{
		_array = _mediumSoldier;
	};

	case "mediumSoldierAndCivilian":
	{
		_array = _mediumSoldierAndCivilian;
	};

	case "slowCivilian":
	{
		_array = _slowCivilian;
	};

	case "slowSoldier":
	{
		_array = _slowSoldier;
	};

	case "slowSoldierAndCivilian":
	{
		_array = _slowSoldierAndCivilian;
	};

	case "walkerCivilian":
	{
		_array = _walkerCivilian;
	};

	case "walkerSoldier":
	{
		_array = _walkerSoldier;
	};

	case "walkerSoldierAndCivilian":
	{
		_array = _walkerSoldierAndCivilian;
	};

	case "demon":
	{
		_array = _demon;
	};

	case "spider":
	{
		_array = _spider;
	};

	case "brittleCrawler":
	{
		_array = _brittleCrawler;
	};

	case "mixedZombie":
	{
		_array = _mixedZombie;
	};

	case "mixedZombieNoSpiderNoCrawler":
	{
		_array = _mixedZombieNoSpiderNoCrawler;
	};

	default
	{
		diag_log ["ZSpawner type invalid:", _type];
	};
};

_gameLogic setVariable ['_array', _array, true];

_grp = creategroup _side;
_grp setVariable ['_gameLogic', _gameLogic];

for "_i" from 1 to _numberByWave step 1 do
{
	_zType = selectRandom _array;
	_unit = _zType createunit [getposATL _gameLogic, _grp, "
		this switchmove 'AmovPercMstpSnonWnonDnon_SaluteOut';
		_code = {
			_gameLogic = (group (_this select 0)) getVariable '_gameLogic';
			_alive = _gameLogic getVariable '_alive';
			_gameLogic setVariable ['_alive', _alive - 1];
		};
		this addEventHandler ['Killed', _code];
		this addEventHandler ['Deleted', _code];
	"];
};

_job = "
_gameLogic = thisTrigger getVariable '_gameLogic';
_side = _gameLogic getVariable '_side';
_alive = _gameLogic getVariable '_alive';
_numberByWave = _gameLogic getVariable '_numberByWave';
_type = _gameLogic getVariable '_type';
_array = _gameLogic getVariable '_array';

_grp = creategroup _side;
_grp setVariable ['_gameLogic', _gameLogic];

for ""_i"" from _alive to _numberByWave step 1 do
{
	_alive = _gameLogic getVariable '_alive';
	_gameLogic setVariable ['_alive', _alive +1];
	_zType = selectRandom _array;
	_unit = _zType createunit [getposATL _gameLogic, _grp, ""
		this switchmove 'AmovPercMstpSnonWnonDnon_SaluteOut';
		_code = {
			_gameLogic = (group (_this select 0)) getVariable '_gameLogic';
			_alive = _gameLogic getVariable '_alive';
			_gameLogic setVariable ['_alive', _alive - 1];
		};
		this addEventHandler ['Killed', _code];
		this addEventHandler ['Deleted', _code];
	""];
	_unit setVariable ['_gameLogic', _gameLogic];
};

";

_trigger = createTrigger ["EmptyDetector", [0,0,0], false];
_trigger setVariable ["_gameLogic", _gameLogic];
_trigger setTriggerActivation ["NONE", "PRESENT", true];
_trigger setTriggerStatements ["!(triggerActivated thisTrigger)", _job, ""];
_trigger setTriggerTimeout [_time, _time, _time, true];

_trigger