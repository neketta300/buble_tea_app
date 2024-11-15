#include <string.h>

extern "C" {
    __attribute__((visibility("default")))
    __attribute__((used))
    int check_credentials(const char *password, const char *confirmpassword) {
        if (strcmp(password, confirmpassword) == 0) {
            return 1; 
        }
        return 0; 
    }
}
