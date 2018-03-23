loadingFinished = false;
onPreloadFinished {loadingFinished = true};
waitUntil {loadingFinished};
loadingFinished