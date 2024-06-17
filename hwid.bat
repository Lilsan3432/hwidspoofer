@echo off
setlocal enabledelayedexpansion

rem Function to prompt user for input and set variables
:promptInput
set /p "newModel=Enter new Model name for USB Device (or press Enter to skip): "
set /p "newSerialNumber1=Enter new SerialNumber for USB Device 1 (or press Enter to skip): "
set /p "newSerialNumber2=Enter new SerialNumber for USB Device 2 (or press Enter to skip): "
set /p "newSerialNumber3=Enter new SerialNumber for USB Device 3 (or press Enter to skip): "
set /p "newCPUSerialNumber=Enter new SerialNumber for CPU (or press Enter to skip): "
set /p "newBIOSSerialNumber=Enter new SerialNumber for BIOS (or press Enter to skip): "
set /p "newMotherboardSerialNumber=Enter new SerialNumber for Motherboard (or press Enter to skip): "
set /p "newGPUSerialNumber=Enter new SerialNumber for GPU (or press Enter to skip): "

rem Change USB Device by Model Name
if not "%newModel%"=="" (
    wmic path Win32_DiskDrive where "MediaType='Removable Media'" call Modify ^/Property Model^="%newModel%"
)

rem Change USB Device 1 SerialNumber
if not "%newSerialNumber1%"=="" (
    wmic path Win32_DiskDrive where "MediaType='Removable Media' AND Index=0" call Modify ^/Property SerialNumber^="%newSerialNumber1%"
)

rem Change USB Device 2 SerialNumber
if not "%newSerialNumber2%"=="" (
    wmic path Win32_DiskDrive where "MediaType='Removable Media' AND Index=1" call Modify ^/Property SerialNumber^="%newSerialNumber2%"
)

rem Change USB Device 3 SerialNumber
if not "%newSerialNumber3%"=="" (
    wmic path Win32_DiskDrive where "MediaType='Removable Media' AND Index=2" call Modify ^/Property SerialNumber^="%newSerialNumber3%"
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

rem Change GPU SerialNumber
if not "%newGPUSerialNumber%"=="" (
    for /f "tokens=2 delims== " %%I in ('wmic path Win32_VideoController get DeviceID /value ^| findstr "="') do (
        wmic path Win32_VideoController where "DeviceID='%%I'" call Modify ^/Property DeviceID^="%newGPUSerialNumber%"
    )
)

echo HWID change complete.

:end
