#Windows Powershell Script

Function ShowToast {
    [CmdletBinding()]
    PARAM (
        [Parameter(Mandatory=$true)][String] $title,
        [Parameter(Mandatory=$true)][String] $message,
        [Parameter(Mandatory=$true)][String] $detail
    )

    [Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] | Out-Null
    [Windows.UI.Notifications.ToastNotification, Windows.UI.Notifications, ContentType = WindowsRuntime] | Out-Null
    [Windows.Data.Xml.Dom.XmlDocument, Windows.Data.Xml.Dom.XmlDocument, ContentType = WindowsRuntime] | Out-Null

    $app_id = '{1AC14E77-02E7-4E5D-B744-2EB1AE5198B7}\WindowsPowerShell\v1.0\powershell.exe'
    $content = @"
<?xml version="1.0" encoding="utf-8"?>
<toast>
    <visual>
        <binding template="ToastGeneric">
            <text>$($title)</text>
            <text>$($message)</text>
            <text>$($detail)</text>
        </binding>
    </visual>
</toast>
"@
    $xml = New-Object Windows.Data.Xml.Dom.XmlDocument
    $xml.LoadXml($content)
    $toast = New-Object Windows.UI.Notifications.ToastNotification $xml
    [Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier($app_id).Show($toast)
}

docker run --rm -v ${PWD}:/workdir texlive-ja-add-newtx uplatex $Args[0]
if (Test-Path (($Args[0]+".dvi"))){
    if (Test-Path ($Args[0]+".pdf")){
        Remove-Item ($Args[0]+".pdf")
    }
    docker run --rm -v ${PWD}:/workdir texlive-ja-add-newtx dvipdfmx $Args[0]

    Remove-Item ($Args[0]+".aux")
    Remove-Item ($Args[0]+".dvi")
    if ( (Test-Path ($Args[0]+".pdf"))){
        ShowToast -title "Tex Compiler OK" -message "Compile Success" -detail ("FileName : "+$Args[0])
    }else {
        ShowToast -title "Tex Compiler Error" -message "Compile Failed" -detail ("FileName : "+$Args[0])
        Start-Process -FilePath code.cmd ($Args[0]+".log")
    }
}else{
    Write-Output "DVI File Not Found : " ($Args[0]+".dvi")
    ShowToast -title "Tex Compiler Error" -message "Compile failed" -detail ("FileName : "+$Args[0])
    if(Test-Path ($Args[0]+".log")){
        Start-Process -FilePath code.cmd ($Args[0]+".log")
    }
}
