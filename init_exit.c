#include <linux/module.h>

MODULE_LICENSE("GPL");
MODULE_AUTHOR("{{authors}}");
// TODO
// MODULE_DESCRIPTION("");
MODULE_VERSION("0.1.0");

int rs_module_init(void);
void rs_module_exit(void);

static int __init c_module_init(void) {
	return rs_module_init();
}

static void __exit c_module_exit(void) {
	rs_module_exit();
}

module_init(c_module_init);
module_exit(c_module_exit);
