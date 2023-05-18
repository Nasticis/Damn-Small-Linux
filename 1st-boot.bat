REM Start qemu on windows.
@ECHO OFF

START qemu\qemu.exe -L qemu/ -no-kqemu -m 64 -localtime -kernel linux24 -initrd minirt24.gz -hda KNOPPIX/knoppix -hdb qemu/harddisk -append "2 qemu frugal legacy quiet norestore base noscsi nousb nofirewire atapicd noideraid noacpi acpi=off noapm noagp ide1=noprobe ide2=noprobe nomce" 

CLS
EXIT


