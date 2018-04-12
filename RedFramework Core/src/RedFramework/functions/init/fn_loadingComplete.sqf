/*
* Function name / Nom de la fonction: RF_fnc_loadingComplete
* Author / Auteur: RedBelette
* Since version / Depuis la version: 1.0.0
* Doc URL: http://www.redframework.com/project-detail/core
*
* EN:
* Usage: This function allows you to wait for the end of the loading screen.
* Example: call RF_fnc_loadingComplete; waitUntil {loadingFinished};
*
* FR:
* Utilisation: Cette fonction permet d'attendre la fin de l'écran de chargement.
* Exemple: call RF_fnc_loadingComplete; waitUntil {loadingFinished};
*/

loadingFinished = false;
onPreloadFinished {loadingFinished = true};
waitUntil {loadingFinished};
loadingFinished