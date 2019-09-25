# mkudooubuntu18_04
Tool to creating an SDcard with Udoobuntu18.04 image for **UDOO-Neo**

## Usage
To create a new **udoobuntu18_04** image use:
```
sudo ./mkudoobuntu18_04.sh
```
This command creates an image file in the directory where mkudoobuntu18_04.sh
was executed.

Once you have created a .img file, you need to create a bootlable
SDcard.
Unmount all the partitions of your SDcard and run the following commands:
```
# Copy the image file in the SDcard
sudo dd bs=1M if=<input-file.img> of=/dev/you_sd_card status=progress

# Synchronize data
sudo sync
```
