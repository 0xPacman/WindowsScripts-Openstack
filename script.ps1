
$servicesToDisable = @(
    "BDESVC",
    "wbengine",
    "DPS",
    "UxSms",
    "Defragsvc",
    "HomeGroupListener",
    "HomeGroupProvider",
    "iphlpsvc",
    "MSiSCSI",
    "swprv",
    "CscService",
    "SstpSvc",
    "wscsvc",
    "SSDPSRV",
    "SysMain",
    "TabletInputService",
    "Themes",
    "upnphost",
    "VSS",
    "SDRSVC",
    "WinDefend",
    "WerSvc",
    "MpsSvc",
    "ehRecvr",
    "ehSched",
    "WSearch",
    "wuauserv",
    "Wlansvc",
    "WwanSvc"
)

foreach ($service in $servicesToDisable) {
    Write-Host "Disabling service: $service"
    $serviceStatus = Get-Service -Name $service -ErrorAction SilentlyContinue
    if ($serviceStatus) {
        Set-Service -Name $service -StartupType Disabled -ErrorAction SilentlyContinue
        Write-Host "Service $service has been disabled."
    } else {
        Write-Host "Service $service not found."
    }
}

Write-Host "All specified services have been processed."
