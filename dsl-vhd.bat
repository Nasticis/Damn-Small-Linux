REM Start qemu on windows.
@ECHO OFF

START qemu\qemu.exe -L qemu/ -no-kqemu -m 128 -soundhw es1370 -localtime -kernel linux24 -initrd minirt24.gz -hda KNOPPIX/knoppix -hdb qemu/harddisk -append "qemu frugal quiet restore=hdb mydsl=hdb/mydsl noscsi nousb nofirewire atapicd noideraid noacpi acpi=off noapm noagp ide1=noprobe ide2=noprobe nomce" 

CLS
EXIT


