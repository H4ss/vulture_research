#include "scanner.h"
#include <stdio.h>

uint32_t ip_str_to_int(char *ip) {
  uint32_t result = 0;
  char *ip_copy = strdup(ip); // Make a copy to safely use strtok
  char *token = strtok(ip_copy, ".");
  while (token != NULL) {
    result = (result << 8) | atoi(token);
    token = strtok(NULL, ".");
  }
  free(ip_copy); // Free the allocated memory
  return result;
}

Network parse_cidr(char *cidr) {
  Network net;
  char *cidr_copy = strdup(cidr); // Make a copy to safely use strtok
  char *token = strtok(cidr_copy, "/");
  net.ip = ip_str_to_int(token);
  net.size = 1;
  net.mask = 0xFFFFFFFF; // Start with a mask of all 1s
  token = strtok(NULL, "/");
  if (token != NULL) {
    int cidr_suffix = atoi(token);
    net.mask <<= (32 - cidr_suffix);    // Shift mask to the left
    net.size = 1 << (32 - cidr_suffix); // Calculate the size based on suffix
  }
  free(cidr_copy); // Free the allocated memory
  return net;
}

void perform_scan(char *subnet) {
  printf("Scanning subnet: %s\n", subnet);

  Network net = parse_cidr(subnet);
  printf("IP: %u\n", net.ip);
  printf("Mask: %u\n", net.mask);
  printf("Size: %u\n", net.size);
}
