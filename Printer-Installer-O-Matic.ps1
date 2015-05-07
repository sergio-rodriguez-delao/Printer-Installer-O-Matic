#IP of Printer 
$PrinterIP = "127.0.0.1"
#Name you want to call Printer
$caption =  "ADP LASER"
#Name of Driver
$DriverName = "Kyocera FS-3900DN"
$PortName = $PrinterIP

Function PortInstall {              
param ($PortName,$PrinterIP)              
              
$PPrinter=([WMIClass]"\\.\ROOT\cimv2:Win32_TcpIpPrinterPort").CreateInstance()              
$PPrinter.name           = $PortName              
$PPrinter.Protocol       = 1              
$PPrinter.HostAddress    = $PrinterIP              
$PPrinter.PortNumber     = 9100              
$PPrinter.Put()                         
}   

Function Printerinstall {              
param ($caption,$PortName,$DriverName)               
              
$iprinter = ([WMIClass]"\\.\Root\cimv2:Win32_Printer").CreateInstance()              
$iprinter.Caption     = $caption              
$iprinter.DriverName  = $DriverName           
$iprinter.PortName    = $PortName              
$iprinter.DeviceID    = $caption              
$iprinter.SetDefaultPrinter()            
$iprinter.Put()              
}              
             
PortInstall -PortName $PortName -PrinterIP $PrinterIP
Printerinstall -caption $caption -PortName $PortName -DriverName $DriverName
