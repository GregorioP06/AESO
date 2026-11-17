#include <stdio.h>
#include <string.h>

extern int conv(char c);
extern int convstring(char *s);

int main(void) {
  char buffer[100];
  scanf("%s", buffer);
  for (int i = 0; i < strlen(buffer); i++) {
    printf("%d\n", conv(buffer[i]));
  }
  scanf("%s", buffer);
  printf("Res: %d\n", convstring(buffer));
  return 0;
}
