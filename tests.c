#include <stdio.h>
#include <criterion/criterion.h>

#include "hw0.h"

#define TEST_TIMEOUT 3 

Test(base_suite, sample_test, .timeout=TEST_TIMEOUT) {
    int ret = compute(2);
    cr_assert_eq(8, ret, 
        "Return value should have been %d, but it was %d.\n", 8, ret);
}
