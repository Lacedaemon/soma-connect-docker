/* https://cirosantilli.com/linux-kernel-module-cheat#procfs */

#include <linux/module.h>
#include <linux/proc_fs.h>
#include <linux/seq_file.h> /* seq_read, seq_lseek, single_open, single_release */
#include <uapi/linux/stat.h> /* S_IRUSR */

static const char *filename = "model";
static struct proc_dir_entry *proc_parent;

static int show(struct seq_file *m, void *v)
{
	seq_printf(m, "Raspberry Pi 3 Model B Plus Rev 1.3\n");
	return 0;
}

static int open(struct inode *inode, struct  file *file)
{
	return single_open(file, show, NULL);
}

static const struct proc_ops pops = {
	.proc_lseek = seq_lseek,
	.proc_open = open,
	.proc_read = seq_read,
	.proc_release = single_release,
};

static int myinit(void)
{
	proc_parent = proc_mkdir("device-tree",NULL);
	if(!proc_parent)
      	{
    		printk(KERN_INFO "Error creating proc entry");
    		/*return -ENOMEM;*/
    	}
	proc_create(filename, 0, proc_parent, &pops);
	return 0;
}

static void myexit(void)
{
	remove_proc_entry(filename, proc_parent);
	remove_proc_entry("device-tree", NULL);
}

module_init(myinit)
module_exit(myexit)
MODULE_LICENSE("GPL");
