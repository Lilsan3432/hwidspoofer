@echo off
setlocal enabledelayedexpansion

rem Function to prompt user for input and set variables
:promptInput
set /p "newModel=Enter new Model name for SanDisk Cruzer Glide USB Device (or press Enter to skip): "
set /p "newSerialNumber1=Enter new SerialNumber for SanDisk Cruzer Glide USB Device (or press Enter to skip): "
set /p "newSerialNumber2=Enter new SerialNumber for ST3500418AS (or press Enter to skip): "
set /p "newSerialNumber3=Enter new SerialNumber for General USB Flash Disk SCSI Disk Device (or press Enter to skip): "
set /p "newSerialNumber4=Enter new SerialNumber for CT480BX500SSD1 (or press Enter to skip): "
set /p "newCPUSerialNumber=Enter new SerialNumber for CPU (or press Enter to skip): "
set /p "newBIOSSerialNumber=Enter new SerialNumber for BIOS (or press Enter to skip): "
set /p "newMotherboardSerialNumber=Enter new SerialNumber for Motherboard (or press Enter to skip): "

rem Change SanDisk Cruzer Glide USB Device
if not "%newModel%"=="" (
    wmic path Win32_DiskDrive where "Model='SanDisk Cruzer Glide USB Device'" call Modify ^/Property Model^="%newModel%"
)
if not "%newSerialNumber1%"=="" (
    wmic path Win32_DiskDrive where "Model='SanDisk Cruzer Glide USB Device'" call Modify ^/Property SerialNumber^="%newSerialNumber1%"
)

rem Change ST3500418AS
if not "%newSerialNumber2%"=="" (
    wmic path Win32_DiskDrive where "Model='ST3500418AS'" call Modify ^/Property SerialNumber^="%newSerialNumber2%"
)

rem Change General USB Flash Disk SCSI Disk Device
if not "%newSerialNumber3%"=="" (
    wmic path Win32_DiskDrive where "Model='General USB Flash Disk SCSI Disk Device'" call Modify ^/Property SerialNumber^="%newSerialNumber3%"
)

rem Change CT480BX500SSD1
if not "%newSerialNumber4%"=="" (
    wmic path Win32_DiskDrive where "Model='CT480BX500SSD1'" call Modify ^/Property SerialNumber^="%newSerialNumber4%"
)

rem Change CPU SerialNumber
if not "%newCPUSerialNumber%"=="" (
    wmic path Win32_Processor call UpdateSystemData
)

rem Change BIOS SerialNumber
if not "%newBIOSSerialNumber%"=="" (
    wmic path Win32_BIOS call Modify ^/Property SerialNumber^="%newBIOSSerialNumber%"
)

rem Change Motherboard SerialNumber
if not "%newMotherboardSerialNumber%"=="" (
    wmic path Win32_BaseBoard call Modify ^/Property SerialNumber^="%newMotherboardSerialNumber%"
)

echo HWID change complete.

:end
