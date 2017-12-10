#pragma once

#include "defs.h"

namespace Eval {
	extern DIRECTION lastDir;
	
	bool moveEval(DIRECTION moveDir);
	int possibleCount();
	bool movedBackward(DIRECTION moveDir);
	void print();
}