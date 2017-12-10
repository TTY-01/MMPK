#pragma once

#include "defs.h"

extern BYTE bmap[4][MAPSIZE][MAPSIZE];
extern BYTE bmapPossible[4][MAPSIZE][MAPSIZE]; // NORTH EAST SOUTH WEST
extern BYTE bmapPossiblePrev[4][MAPSIZE][MAPSIZE];
extern BYTE bmapTrue[MAPSIZE][MAPSIZE]; // BLACK BLUE RED GREEN
extern int mapRow, mapColumn;

namespace Bytemap {
	void initBMaps();
	void printBMap(BYTE map[MAPSIZE][MAPSIZE]);
	void printPossibilityBmaps();
	COLOR colorOfSquare(BYTE map[MAPSIZE][MAPSIZE], int row, int column);
	COLOR colorOfCurrentSquare();
	bool move(DIRECTION dir);
	bool moveUp();
	bool moveDown();
	bool moveRight();
	bool moveLeft();
	bool move(DIRECTION dir, int& row, int& column);
	bool moveUp(int& row, int& column);
	bool moveDown(int& row, int& column);
	bool moveRight(int& row, int& column);
	bool moveLeft(int& row, int& column);
	int popCount(BYTE map[MAPSIZE][MAPSIZE]);
	bool lsbyte(BYTE map[MAPSIZE][MAPSIZE], int& row, int& column);
}