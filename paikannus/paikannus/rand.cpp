#include "stdafx.h"
#include "rand.h"

std::random_device randDevice;
std::default_random_engine randEngine(randDevice());
std::uniform_int_distribution<int> uniform_dist;
std::uniform_int_distribution<int> uniformDist03, uniformDistMapsize;

void initRand() {
	uniformDist03 = std::uniform_int_distribution<int>(BLACK, GREEN);
	uniformDistMapsize = std::uniform_int_distribution<int>(0, MAPSIZE - 1);
}

BYTE randColor()
{
	return COLOR(uniformDist03(randEngine));
}

DIRECTION randDirection() {
	return DIRECTION(uniformDist03(randEngine));
}

int randNumberMapsize() {
	return uniformDistMapsize(randEngine);
}