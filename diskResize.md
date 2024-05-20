# [Main Menu](index.html)

1. Make a new partition from the disk, say _sda_. 

       sudo fdisk /dev/sda

2. Press "Enter" button for default options like new partition (n), first sector, last sector

3. Press __w__ to write the changes

4. Create physical volume(PV) and add it to the existing volume group(VG) with the below commands

       sudo pvcreate /dev/sda4    #its the 4th partition of the disk at that time

5. Check created PV

       sudo pvs

6. Now extend the VG size from the created PV with below command

       sudo vgextend ubuntu-vg /dev/sda4

7. Check the new space in volume group

       sudo vgs

8. Now extend the existing lvm with total available space in the volume group (VG) 

       sudo lvextend -l +100%FREE /dev/ubuntu-vg/ubuntu-lv

9. To implement the above size to the lvm run below command

       sudo resize2fs /dev/ubuntu-vg/ubuntu-lv

10. Now finally check the new size of lvm 

        df -hT