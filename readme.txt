#########################################################################
#
# DSL Qemu Embedded and Native Instructions
#
# DSL &  QEMU This is to be considered a preview Version.
#
#########################################################################
#

I hope you like Damn Small Linux!

Authors:
John Andrews John@damnsmalllinux.org
Robert Shingledecker Robert@damnsmalllinux.org 

--------------------------------------------------------------------------
DSL Qemu Embedded is designed to be run from a pendrive and boot either 
nativaly or from within Windows. You do not need to install ANYTHING
on Windows!

You can also have shared access to your backup and MyDSL extensions!

---------------------------------------------------------------------------

NATIVE

Booting directly into DSL via BIOS Instructions:
Make sure your machine is capable of booting from USB
Also some machines also require that USB-KEYBOARD be also enabled in BIOS. 

Note many others use various methdos to boot from USB.
Booting from USB pendrives vary widely based on BIOS and pendrives.

Check that you have a backup device specified, by using DSLpanel
Backup/Restore button. Use appropriate partition depending on install
type, e.g., sda1

For MyDSL extensions, make a level 1 directory named mydsl/
and place your extensions there. Can be any partition. 
Additionally you may make further directories under the mydsl/:

mydsl/modules  -  will insmod additional user modules
mydsl/optional -  will not load the extensions but instead make a menu


---------------------------------------------------------------------------

To use the Virtual Machine provided by Qemu...

When Running from Windows:
Double click on 'dsl-base.bat'

NOTE: The default dsl-base.bat has no other devices specified.

You will probably want to share your backup and MyDSL extensions 
between native and Qemu virtual. 

There are two ways to save your backup and/or extensions:

1. Create a Qemu Virtual Hard Disk and use the dsl-vhd.bat file.

- or -

2. Setup your DSL pendrive via native USB bios boot saving your 
   backup and extensions. Then to have Qemu load your backup and
   extensions, click on the pendrive.bat

----------------------------------------------------------------

1. To create a Qemu Virtual Hard Drive use the qemu-img.exe program.

Open a dos command window and CD to your pendrive. Next CD inside
the qemu folder. There you should see the program qemu-img.exe

Create a Qemu virtual hard drive. The size is up to you and your 
pendrive's free space.

For example, a 64MB pendrive:

qemu-img.exe create harddisk 60M

For a 256MB pendrive:

qemu-img.exe create harddisk 128M

exit from dos command window.

Note: the name harddisk must be used at this name is setup inside DSL.
Note: This virtual device is mapped to drive hdb, see dsl-vhd.bat

Note: Upon first boot you must format this device, there is a special
1st-boot.bat that will boot to a root prompt. There you
must perform the following format and setup:

Note: Upon first booting you will see modprobe errors, because the 
virtual disk is not formatted yet!

# mke2fs /dev/hdb

Warning: /dev/hdb is entire device, not just one partition!
Proceed anyway? (y/n) 

Enter y

Wait for device to be formatted and the system prompt returns

# mount /mnt/hdb
# mkdir /mnt/hdb/mydsl
# mkdir /mnt/hdb/mydsl/modules
# cp /KNOPPIX/lib/modules/2.4.26/kernel/drivers/block/cloop.o /mnt/hdb/mydsl/modules/.

# shutdown -h now

This will shutdown DSL and exit the virtual machine.

Now you can boot from the dsl-vhd.bat and begin to use your 
DSL/Qemu with Virtual Hard Drive system.

Note: Upon first normal boot you will be presented with the X-Setup
screens. You may tab to Cancel and press Enter to accept the defaults.

Backup should use hdb
Saving mydsl extensions should use /mnt/hdb/mydsl. 

Note: You will likely need to first mount /mnt/hdb and then
download extensions to /mnt/hdb/mydsl

Note: The mount tool is not aware of virtual drives.

Note: To see mounted devices:  sudo mount
Note: To mount the virtual drive: sudo mount /mnt/hdb

Using Qemu Virtual Harddrive from natively booted DSL...
When booting the pendrive natively use the following to share
virtual drive.

boot: dsl qemu frugal restore=harddisk mydsl=harddisk/mydsl

In fact, if the virtual hard drive is your preferred method then
you should edit the the file syslinux.cfg and add to the APPEND section:

   qemu frugal restore=harddisk mydsl=harddisk/mydsl


----------------------------------------------------------------

2. Starting with this version of Qemu you can directly access 
the native files on the pendrive.

How to do this depends on how Windows see your pendrive, i.e.,
as drive D: or E: or perhaps G:

Double click on 'pendrive.bat'

If you have your pendrive setup as per the DSL installations then
you will have your extensions loaded and backup restored from either
native or Qemu booted.

Note: Qemu v0.8.2 only allows READ access for the extensions and backup.
The easiest way to have WRITE access:

1. In Windows "share" your pendrive
2. In Windows note your machine's IP number
   Open a cmd/command window and type ipconfig
3. Start DSL using the pendrive.bat
   Add files, change settings in your home directory.
   Download extensions into /cdrom/mydsl
** Before you shutdown do the following ***
4. Click DSLpanel, click Backup/Restore, click Backup
5. Use the menu Apps->Net->SMBclient
   Enter your specifics to connect
6. smb:\> lcd /cdrom
   smb:\> put backup.tar.gz
   smb:\> lcd mydsl
   smb:\> cd mydsl
   smb:\> put just_downloaded_extension
     (repeat for all newly downloaded extensions)
   smb:\> quit
7. Now shutdown DSL.

----------------------------------------------------------------------------
If you have trouble booting native from USB then read on:
----------------------------------------------------------------------------

To boot from the standard DSL boot usb floppy at the first boot prompt type:

boot: dsl fromusb frugal

-----------------------------------------------------------------------------

To boot from the standard DSL cdrom at the first boot prompt type:

boot: dsl fromhd=/dev/sda1 frugal

Note: here need an additional boot time option to tell the standard cdrom
version to not boot from the cd, but to boot from the pendrive.

-----------------------------------------------------------------------------

If your Qemu booted screen is unreadable and colors are all messed up,
then use Windows and right click on the qemu.exe and select Win98
compatible mode. Sometimes it is called Run in 256 Colors.

-----------------------------------------------------------------------------
For Qemu Windows questions and more advanced configuration options go to:
http://www.h7.dion.ne.jp/~qemu-win/

For DSL support go to http://www.damnsmalllinux.org
and follow the link to the fourms.

If you are looking for DSL within Linux please go to the general Qemu site:
http://fabrice.bellard.free.fr/qemu
