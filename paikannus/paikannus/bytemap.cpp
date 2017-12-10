#include "stdafx.h"
#include "bytemap.h"
#include "rand.h"
#include <string>

#include <algorithm>

BYTE bmap[4][MAPSIZE][MAPSIZE];
BYTE bmapPossible[4][MAPSIZE][MAPSIZE];
BYTE bmapPossiblePrev[4][MAPSIZE][MAPSIZE];
BYTE bmapTrue[MAPSIZE][MAPSIZE];
int mapRow, mapColumn;

namespace Bytemap {
	
	void initBMaps() {

		for (int i = 0; i < MAPSIZE; ++i) {
			for (int j = 0; j < MAPSIZE; ++j) {

				bmapTrue[i][j] = randColor();
				bmap[NORTH][i][j] = bmapTrue[i][j];
			}
		}

		// Rotate 90 degrees anticlockwise to initialize other maps
		for (int i = 0; i < MAPSIZE; ++i) {
			for (int j = 0; j < MAPSIZE; ++j) {
				bmap[WEST][i][j] = bmap[NORTH][MAPSIZE - 1 - j][i];
			}
		}

		for (int i = 0; i < MAPSIZE; ++i) {
			for (int j = 0; j < MAPSIZE; ++j) {
				bmap[SOUTH][i][j] = bmap[WEST][MAPSIZE - 1 - j][i];
			}
		}

		for (int i = 0; i < MAPSIZE; ++i) {
			for (int j = 0; j < MAPSIZE; ++j) {
				bmap[EAST][i][j] = bmap[SOUTH][MAPSIZE - 1 - j][i];
			}
		}

		mapRow = randNumberMapsize();
		mapColumn = randNumberMapsize();
		COLOR initColor = colorOfCurrentSquare();
		
		// init bmapPossible
		for (int i = 0; i < MAPSIZE; ++i) {
			for (int j = 0; j < MAPSIZE; ++j) {
				for (int dir = NORTH; dir <= WEST; ++dir) {

					if (bmap[dir][i][j] == initColor) {
						bmapPossible[dir][i][j] = 1;

					} else {
						bmapPossible[dir][i][j] = 0;
					}
				}
			}
		}
	}

	void printBMap(BYTE map[MAPSIZE][MAPSIZE]) {

		for (int i = MAPSIZE - 1; i >= 0; --i) {
			for (int j = 0; j <= MAPSIZE - 1; ++j) {

				COLOR squareColor = colorOfSquare(map, i, j);

				if (squareColor == BLACK) std::cout << "X ";
				if (squareColor == BLUE) std::cout << "B ";
				if (squareColor == RED) std::cout << "R ";
				if (squareColor == GREEN) std::cout << "G ";

			}
			std::cout << std::endl;
		}
		std::cout << std::endl;
	}

	void printPossibilityBmaps() {
		for (int dir = NORTH; dir <= WEST; ++dir) {
			for (int i = MAPSIZE - 1; i >= 0; --i) {
				for (int j = 0; j <= MAPSIZE - 1; ++j) {
					
					std::cout << std::to_string(bmapPossible[dir][i][j]) << " ";

				}
				std::cout << std::endl;
			}
			std::cout << std::endl;
		}
		std::cout << std::endl;
	}

	COLOR colorOfSquare(BYTE map[MAPSIZE][MAPSIZE], int row, int column ) {
		return (COLOR)map[row][column];
	}

	COLOR colorOfCurrentSquare() {
		return (COLOR)bmapTrue[mapRow][mapColumn];
	}

	bool move(DIRECTION dir) {
		if (dir == NORTH) return moveUp();
		if (dir == SOUTH) return moveDown();
		if (dir == EAST) return moveRight();
		if (dir == WEST) return moveLeft();
		return false;
	}

	bool moveUp() {
		if (mapRow + 1 >= MAPSIZE) return false;
		
		mapRow += 1;
		return true;
	}

	bool moveDown() {
		if (mapRow - 1 < 0) return false;

		mapRow -= 1;
		return true;
	}

	bool moveRight() {
		if (mapColumn + 1 >= MAPSIZE) return false;

		mapColumn += 1;
		return true;
	}

	bool moveLeft() {
		if (mapColumn - 1 < 0) return false;
		
		mapColumn -= 1;
		return true;
	}

	bool move(DIRECTION dir, int& row, int& column) {
		if (dir == NORTH) return moveUp(row, column);
		if (dir == SOUTH) return moveDown(row, column);
		if (dir == EAST) return moveRight(row, column);
		if (dir == WEST) return moveLeft(row, column);
		return false;
	}

	bool moveUp(int& row, int& column) {
		if (row + 1 >= MAPSIZE) return false;
		
		row += 1;
		return true;
	}

	bool moveDown(int& row, int& column) {
		if (row - 1 < 0) return false;

		row -= 1;
		return true;
	}

	bool moveRight(int& row, int& column) {
		if (column + 1 >= MAPSIZE) return false;

		column += 1;
		return true;
	}

	bool moveLeft(int& row, int& column) {
		if (column - 1 < 0) return false;

		column -= 1;
		return true;
	}

	int popCount(BYTE map[MAPSIZE][MAPSIZE]) {
		int popCount = 0;

		for (int i = 0; i < MAPSIZE; ++i) {
			for (int j = 0; j < MAPSIZE; ++j) {
				
				if (map[i][j] != 0) ++popCount;

			}
		}
		return popCount;
	}
	
	bool lsbyte(BYTE map[MAPSIZE][MAPSIZE], int& row, int& column) {

		for (row; row < MAPSIZE; ++row) {

			column = std::distance(map[row], std::find(map[row], map[row] + MAPSIZE, 1));
			if (column < MAPSIZE) return true;

		}
		return false;
	}


}