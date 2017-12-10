#include "stdafx.h"
#include "init.h"
#include "rand.h"
#include "bytemap.h"

void initAll() {
	
	initRand();
	Bytemap::initBMaps();

}