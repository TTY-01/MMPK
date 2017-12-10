#include "stdafx.h"
#include "movegen.h"
#include "rand.h"
#include "bytemap.h"

DIRECTION genMove() {
	bool moved = false;
	DIRECTION dir = randDirection();

	while (!moved) {
		dir = randDirection();
		moved = Bytemap::move(dir);
	}

	return dir;
}