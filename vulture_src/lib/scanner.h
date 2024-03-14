#ifndef SCANNER_H
#define SCANNER_H

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
  uint32_t ip;
  uint32_t mask;
  uint32_t size;
} Network;

// Function declaration
void perform_scan(char *subnet);

#endif
