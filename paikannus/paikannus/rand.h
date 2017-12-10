#pragma once

#include "defs.h"
#include <iostream>
#include <iomanip>
#include <string>
#include <map>
#include <random>
#include <cmath>

void initRand();
BYTE randColor();
DIRECTION randDirection();
int randNumberMapsize();

extern std::random_device randDevice;
extern std::default_random_engine randEngine;
extern std::uniform_int_distribution<int> uniformDist03, uniformDistMapsize;