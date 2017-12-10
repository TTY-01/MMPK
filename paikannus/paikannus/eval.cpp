#include "stdafx.h"
#include "eval.h"
#include "bytemap.h"
#include <algorithm>
#include <iostream>

using namespace Bytemap;

namespace Eval {

	// optimization: check first if moved back.
	
	DIRECTION lastDir = NONE;

	// Updates possibleMaps after a move.
	bool moveEval(DIRECTION moveDir) {
		COLOR expectedColor = colorOfCurrentSquare();
		bool movedBack = movedBackward(moveDir);

		for (int dir = NORTH; dir <= WEST; ++dir) {
			int lsbRow = 0;
			int lsbColumn = 0;

			// make copy of possibilitymaps.
			for (int i = 0; i < MAPSIZE; ++i) {
				for (int j = 0; j < MAPSIZE; ++j) {
					bmapPossiblePrev[dir][i][j] = bmapPossible[dir][i][j];
					bmapPossible[dir][i][j] = 0;
				}
			}

			// find row and column for previous possibilities lsbyte.
			while (lsbyte(bmapPossiblePrev[dir], lsbRow, lsbColumn)) {
				
				// set lsbyte to 0 for next iteration.
				bmapPossiblePrev[dir][lsbRow][lsbColumn] = 0;

				int newRow = lsbRow;
				int newColumn = lsbColumn;
				// check if it's possible to make a move in wanted direction.
				if (movedBack || move(moveDir, newRow, newColumn)) {
					
					// check if new square is of right color.
					if (movedBack || colorOfSquare(bmap[dir], newRow, newColumn) == expectedColor) {
						
						bmapPossible[dir][newRow][newColumn] = 1;
					}
				}
			}
		}

		return (possibleCount() == 1);
	}

	int possibleCount() {
		return popCount(bmapPossible[NORTH])
		     + popCount(bmapPossible[EAST])
			 + popCount(bmapPossible[SOUTH])
			 + popCount(bmapPossible[WEST]);
	}

	// Optimization function to increase speed.
	bool movedBackward(DIRECTION moveDir) {
		if (lastDir == NORTH & moveDir == SOUTH) return true;
		if (lastDir == SOUTH & moveDir == NORTH) return true;
		if (lastDir == EAST & moveDir == WEST) return true;
		if (lastDir == WEST & moveDir == EAST) return true;
		return false;
	}

	void print() {
		std::cout << "Possible squares: " << possibleCount() << ". " << std::endl;
		std::cout << "Current color: " << colorOfCurrentSquare() << ". " << std::endl;
		
		printPossibilityBmaps();
	} 
}