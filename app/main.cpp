#include "libfoo.h"

#include <cstdio>
#include <cstdlib>

int main() {
  bool alright = libfoo_function(41) == 42;
  printf("Everything is %s.\n", alright ? "alright" : "broken");
  return alright ? EXIT_SUCCESS : EXIT_FAILURE;
}
