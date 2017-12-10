#include "stdafx.h"
#include "init.h"
#include "eval.h"
#include "movegen.h"
#include "bytemap.h"
#include "data.h"
#include <iostream>
#include <fstream>
#include <string>

int main()
{

	std::string filename = "datat/data" + std::to_string(MAPSIZE) + ".txt";
	Data::collectData(1000, filename);

    return 0;
}