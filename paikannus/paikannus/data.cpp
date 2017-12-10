#include "stdafx.h"
#include "data.h"
#include "init.h"
#include "eval.h"
#include "movegen.h"
#include <iostream>
#include <fstream>

namespace Data {
	
	void collectData(int dataPoints, std::string filePath) {

		std::ofstream outputFile(filePath);

		for (int i = 0; i < dataPoints; ++i) {
			int moves = 0;

			initAll();

			while (Eval::possibleCount() != 1) {

				Eval::moveEval(genMove());
				++moves;
			}

			outputFile << moves << " ";
		}

		outputFile.close();

	}
}