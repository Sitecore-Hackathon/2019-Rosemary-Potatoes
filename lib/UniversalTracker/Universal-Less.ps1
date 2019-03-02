<#
.SYNOPSIS
    SITECORE HACKATHON 2019

    UNIVERSAL-LESS

    Establish an automated, configurable process for installing 
    Universal Tracker v2.1  within an onPrem Sitecore install

.DESCRIPTION


.NOTES


.AUTHORS
    ~~ TEAM ROSEMARY POTATOES ~~
    
#>

<# This form was created using POSHGUI.com  a free online gui designer for PowerShell
.NAME
    Untitled
#>

function Show-Dialog {
    $formUniversalLess = New-Object system.Windows.Forms.Form
    $formUniversalLess.ClientSize = '400,483'
    $formUniversalLess.text = "Universal-Less"
    $formUniversalLess.TopMost = $false
    
    $txtSqlServerName = New-Object system.Windows.Forms.TextBox
    $txtSqlServerName.multiline = $false
    $txtSqlServerName.text = ".\SQL2016"
    $txtSqlServerName.width = 353
    $txtSqlServerName.height = 20
    $txtSqlServerName.location = New-Object System.Drawing.Point(15, 48)
    $txtSqlServerName.Font = 'Microsoft Sans Serif,10'
    
    $txtSqlPassword = New-Object system.Windows.Forms.TextBox
    $txtSqlPassword.multiline = $false
    $txtSqlPassword.width = 353
    $txtSqlPassword.height = 20
    $txtSqlPassword.location = New-Object System.Drawing.Point(15, 155)
    $txtSqlPassword.Font = 'Microsoft Sans Serif,10'
    
    $txtSqlUser = New-Object system.Windows.Forms.TextBox
    $txtSqlUser.multiline = $false
    $txtSqlUser.text = "sa"
    $txtSqlUser.width = 353
    $txtSqlUser.height = 20
    $txtSqlUser.location = New-Object System.Drawing.Point(15, 100)
    $txtSqlUser.Font = 'Microsoft Sans Serif,10'
    
    $lblSqlServerName = New-Object system.Windows.Forms.Label
    $lblSqlServerName.text = "SQL Server Name"
    $lblSqlServerName.AutoSize = $true
    $lblSqlServerName.width = 25
    $lblSqlServerName.height = 10
    $lblSqlServerName.location = New-Object System.Drawing.Point(15, 28)
    $lblSqlServerName.Font = 'Microsoft Sans Serif,10'
    
    $lblSqlSeverUser = New-Object system.Windows.Forms.Label
    $lblSqlSeverUser.text = "SQL User"
    $lblSqlSeverUser.AutoSize = $true
    $lblSqlSeverUser.width = 25
    $lblSqlSeverUser.height = 10
    $lblSqlSeverUser.location = New-Object System.Drawing.Point(15, 80)
    $lblSqlSeverUser.Font = 'Microsoft Sans Serif,10'
    
    $lblSqlPassword = New-Object system.Windows.Forms.Label
    $lblSqlPassword.text = "SQL Password"
    $lblSqlPassword.AutoSize = $true
    $lblSqlPassword.width = 25
    $lblSqlPassword.height = 10
    $lblSqlPassword.location = New-Object System.Drawing.Point(15, 134)
    $lblSqlPassword.Font = 'Microsoft Sans Serif,10'
    
    $btnCheck = New-Object system.Windows.Forms.Button
    $btnCheck.text = "Check"
    $btnCheck.width = 60
    $btnCheck.height = 30
    $btnCheck.location = New-Object System.Drawing.Point(308, 194)
    $btnCheck.Font = 'Microsoft Sans Serif,10'
    
    $Panel2 = New-Object system.Windows.Forms.Panel
    $Panel2.height = 171
    $Panel2.width = 380
    $Panel2.location = New-Object System.Drawing.Point(6, 252)
    
    $lblLicensePath = New-Object system.Windows.Forms.Label
    $lblLicensePath.text = "License Path"
    $lblLicensePath.AutoSize = $true
    $lblLicensePath.width = 25
    $lblLicensePath.height = 10
    $lblLicensePath.location = New-Object System.Drawing.Point(9, 10)
    $lblLicensePath.Font = 'Microsoft Sans Serif,10'
    
    $lblSiteFolderPath = New-Object system.Windows.Forms.Label
    $lblSiteFolderPath.text = "Root Site Path"
    $lblSiteFolderPath.AutoSize = $true
    $lblSiteFolderPath.width = 25
    $lblSiteFolderPath.height = 10
    $lblSiteFolderPath.location = New-Object System.Drawing.Point(9, 82)
    $lblSiteFolderPath.Font = 'Microsoft Sans Serif,10'
    
    $txtLicenseFolderPath = New-Object system.Windows.Forms.TextBox
    $txtLicenseFolderPath.multiline = $false
    $txtLicenseFolderPath.width = 317
    $txtLicenseFolderPath.height = 20
    $txtLicenseFolderPath.location = New-Object System.Drawing.Point(9, 34)
    $txtLicenseFolderPath.Font = 'Microsoft Sans Serif,10'
    
    $btnLicenseBrowse = New-Object system.Windows.Forms.Button
    $btnLicenseBrowse.text = "..."
    $btnLicenseBrowse.width = 29
    $btnLicenseBrowse.height = 23
    $btnLicenseBrowse.location = New-Object System.Drawing.Point(331, 31)
    $btnLicenseBrowse.Font = 'Microsoft Sans Serif,10'
    
    $txtSiteFolderPath = New-Object system.Windows.Forms.TextBox
    $txtSiteFolderPath.multiline = $false
    $txtSiteFolderPath.text = "c:/inetpub/wwwroot"
    $txtSiteFolderPath.width = 317
    $txtSiteFolderPath.height = 20
    $txtSiteFolderPath.location = New-Object System.Drawing.Point(9, 107)
    $txtSiteFolderPath.Font = 'Microsoft Sans Serif,10'
    
    $btnSitePathBrowse = New-Object system.Windows.Forms.Button
    $btnSitePathBrowse.text = "..."
    $btnSitePathBrowse.width = 29
    $btnSitePathBrowse.height = 23
    $btnSitePathBrowse.location = New-Object System.Drawing.Point(331, 104)
    $btnSitePathBrowse.Font = 'Microsoft Sans Serif,10'
    
    $txtInstall = New-Object system.Windows.Forms.Button
    $txtInstall.text = "Install Universal Tracker"
    $txtInstall.width = 169
    $txtInstall.height = 30
    $txtInstall.location = New-Object System.Drawing.Point(217, 438)
    $txtInstall.Font = 'Microsoft Sans Serif,10'
    
    $lblDbName = New-Object system.Windows.Forms.Label
    $lblDbName.text = "DB Name"
    $lblDbName.AutoSize = $true
    $lblDbName.width = 25
    $lblDbName.height = 10
    $lblDbName.location = New-Object System.Drawing.Point(19, 204)
    $lblDbName.Font = 'Microsoft Sans Serif,10'
    
    $txtDbName = New-Object system.Windows.Forms.TextBox
    $txtDbName.multiline = $false
    $txtDbName.text = "SitecoreUniversalTracker"
    $txtDbName.width = 199
    $txtDbName.height = 20
    $txtDbName.location = New-Object System.Drawing.Point(97, 203)
    $txtDbName.Font = 'Microsoft Sans Serif,10'
    
    $formUniversalLess.controls.AddRange(@($txtSqlServerName, $txtSqlPassword, $txtSqlUser, $lblSqlServerName, $lblSqlSeverUser, $lblSqlPassword, $btnCheck, $Panel2, $txtInstall, $lblDbName, $txtDbName))
    $Panel2.controls.AddRange(@($lblLicensePath, $lblSiteFolderPath, $txtLicenseFolderPath, $btnLicenseBrowse, $txtSiteFolderPath, $btnSitePathBrowse))

    $btnCheck.Add_Click( { 
            # TODO: Check if SQL data in form is valid.

        })

    $btnLicenseBrowse.Add_Click( { 
            $selectedLicenseFolder = Get-Folder
            $txtLicenseFolderPath.Text = $selectedLicenseFolder
        })

    $btnSitePathBrowse.Add_Click( { 
            $selectedBrowserFolder = Get-Folder
            $txtSiteFolderPath.Text = $selectedBrowserFolder
        })
        
    $txtInstall.Add_Click( { 

            # Close the dialog
            $formUniversalLess.Close();
            
            # Unizip files from download
            UnzipUniveralTrackerFiles
          
            Write-Host "Installing Universal Tracker..." -ForegroundColor Green
            # Install Universal Tracker
            Install-UniversalTracker -SqlServerName $txtSqlServerName.Text `
                -SqlServerUser $txtSqlUser.Text `
                -SqlServerPassword $txtSqlPassword.Text `
                -SqlDbName $txtDbName.Text `
                -LicensePath $txtLicenseFolderPath.Text `
                -RootSitePath $txtSiteFolderPath.Text


            $dbConnectionString = "user id=$($txtSqlUser.Text);password=$($txtSqlPassword.Text);data source=$($txtSqlServerName.Text);database=$($txtDbName.Text);ConnectRetryCount=5;ConnectRetryInterval=10;Connection Timeout=50;"

            Write-Host "Installing Collection Service..." -ForegroundColor Green
            # Install Collection Service
            $collectionWdp = "$PSScriptRoot\Sitecore.Tracking.Collection.Service.1.0.0-r00045.wdp.zip"
            $collectionDeploy = "$PSScriptRoot\Sitecore.Tracking.Collection.Service.1.0.0-r00045.deploy\OnPremDeploymentInfrastructure\onPremDeploy.ps1" 
            Install-Service -DeployScriptPath $collectionDeploy -WdpPackagePath $collectionWdp -DatabaseConnectionString $dbConnectionString -LicenseXmlPath $txtLicenseFolderPath.Text -SiteFolderPath $txtSiteFolderPath.Text

            Write-Host "Installing Processing Service..." -ForegroundColor Green
            # Install Processing Service
            $processingWdp = "$PSScriptRoot\Sitecore.Tracking.Processing.Service.1.0.0-r00070.wdp.zip"
            $processingDeploy = "$PSScriptRoot\Sitecore.Tracking.Processing.Service.1.0.0-r00070.deploy\OnPremDeploymentInfrastructure\onPremDeploy.ps1" 
            Install-Service -DeployScriptPath $processingDeploy -WdpPackagePath $processingWdp -DatabaseConnectionString $dbConnectionString -LicenseXmlPath $txtLicenseFolderPath.Text -SiteFolderPath $txtSiteFolderPath.Text
        })

    
    [void] $formUniversalLess.ShowDialog() 
}

function Get-Folder($directory) {
    [System.Reflection.Assembly]::LoadWithPartialName("system.windows.forms")|Out-Null

    $foldername = New-Object System.Windows.Forms.FolderBrowserDialog
    $foldername.Description = "Select a folder"
    $foldername.rootfolder = "MyComputer"

    if ($foldername.ShowDialog() -eq "OK") {
        $folder += $foldername.SelectedPath
    }
    return $folder
}


function Unzip {
    param([string]$zipfile, [string]$outpath)

    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
}

function Invoke-Command {
    param ( [string]$program = $(throw "Please specify a program" ),
            [string]$argumentString = "",
            [switch]$waitForExit )

    $psi = new-object "Diagnostics.ProcessStartInfo"
    $psi.FileName = $program 
    $psi.Arguments = $argumentString
    $proc = [Diagnostics.Process]::Start($psi)
    if ( $waitForExit ) {
        $proc.WaitForExit();
    }
}

function UnzipUniveralTrackerFiles {
    Write-Host "Extracting files..." -ForegroundColor Green
    $pathRoot = $PSScriptRoot

    # Extract 'Sitecore Universal Tracker 1.0.0.zip'
    Unzip "$pathRoot\Sitecore Universal Tracker 1.0.0.zip" "$pathRoot\" 

    # Extract 'Sitecore.Tracking.Sql.Service.1.0.0-r00056.deploy.zip' and 'Sitecore.Tracking.Sql.Service.1.0.0-r00056.dacpac.zip'
    Unzip "$pathRoot\Sitecore.Tracking.Sql.1.0.0-r00056.deploy.zip" "$pathRoot\Sitecore.Tracking.Sql.1.0.0-r00056.deploy" 
    Unzip "$pathRoot\Sitecore.Tracking.Sql.1.0.0-r00056.dacpac.zip" "$pathRoot\Sitecore.Tracking.Sql.1.0.0-r00056.dacpac" 

    
    Unzip "$pathRoot\Sitecore.Tracking.Collection.Service.1.0.0-r00045.deploy.zip" "$pathRoot\Sitecore.Tracking.Collection.Service.1.0.0-r00045.deploy" 

    Unzip "$pathRoot\Sitecore.Tracking.Processing.Service.1.0.0-r00070.deploy.zip" "$pathRoot\Sitecore.Tracking.Processing.Service.1.0.0-r00070.deploy" 
    
    
    Write-Host "Extraction complete!" -ForegroundColor Green
}


function Install-UniversalTracker {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$SqlServerName,

        [Parameter(Mandatory = $true)]
        [string]$SqlServerUser,

        [Parameter(Mandatory = $true)]
        [string]$SqlServerPassword,

        [Parameter(Mandatory = $true)]
        [string]$SqlDbName,

        [Parameter(Mandatory = $true)]
        [string]$LicensePath,

        [Parameter(Mandatory = $true)]
        [string]$RootSitePath
        
    )

    # Run onPremDeployfor
    $sqlDeployPath = "$PSScriptRoot\Sitecore.Tracking.Sql.1.0.0-r00056.deploy\OnPremDeploymentInfrastructure\onPremDeploy.ps1"
    $sqlDeployArgumentList = @()
    $sqlDeployArgumentList += ("-sourceDacFile", "$PSScriptRoot\Sitecore.Tracking.Sql.1.0.0-r00056.dacpac\Sitecore.Tracking.dacpac")
    $sqlDeployArgumentList += ("-serverName", "$SqlServerName")
    $sqlDeployArgumentList += ("-dbName", "$SqlDbName")
    $sqlDeployArgumentList += ("-dbUser", "$SqlServerUser")
    $sqlDeployArgumentList += ("-dbPassword", "$SqlServerPassword")

    #Invoke-Command -program $sqlDeployPath -argumentString $sqlDeployArgumentList -waitForExit
    
    #TODO: Figure out how to call the sqlDeployPath script and wait for it to complete.
    Invoke-Expression "& `"$sqlDeployPath`" $sqlDeployArgumentList" | Out-Null


    #Add the binding for your service in the %windir%\System32\drivers\etc\hosts file.

    # In IIS, navigate to the website you specified in instanceName. 
    # Navigate to Bindings. Double-click on the port 443 binding and select the SSL certificate.
}


function Install-Service {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$DeployScriptPath,

        [Parameter(Mandatory = $true)]
        [string]$WdpPackagePath,

        [Parameter(Mandatory = $true)]
        [string]$DatabaseConnectionString,

        [Parameter(Mandatory = $true)]
        [string]$LicenseXmlPath,

        [Parameter(Mandatory = $true)]
        [string]$SiteFolderPath
    )

    # Run onPremDeploy
    $installArgs = @()
    $installArgs += ("-wdpPackagePath", "$WdpPackagePath")
    $installArgs += ("-databaseConnectionString", "`"$DatabaseConnectionString`"")      
    $installArgs += ("-licenseXmlPath", "$LicenseXmlPath\license.xml")
    $installArgs += ("-siteFolderPath", "$SiteFolderPath")
    $installArgs += ("-siteHttpPort", "80")
  
    Write-Host "`"$DeployScriptPath`" $installArgs"  $DeployScriptPath -ForegroundColor Gray

    #Invoke-Command -program $DeployScriptPath -argumentString $installArgs -waitForExit
    #TODO: Figure out how to call the sqlDeployPath script and wait for it to complete.
    Invoke-Expression "& `"$DeployScriptPath`" $installArgs" | Out-Null
}

function CleanUp {    
    Get-ChildItem -Path "$PSScriptRoot\" -File -Recurse |
    Where-Object { $_.Name -ne "Universal-Less.ps1" -and $_.Name -ne "Sitecore Universal Tracker 1.0.0.zip" } |
    Remove-Item

    Get-ChildItem -Path "$PSScriptRoot\" -Directory -Recurse |
    Where-Object { $_.Name -ne "Universal-Less.ps1" -and $_.Name -ne "Sitecore Universal Tracker 1.0.0.zip" } |
    Remove-Item -Recurse
}

# Per instructions
Set-ExecutionPolicy RemoteSigned

# Manual Step?: Download the Sitecore Universal Tracker package --- Unzip the file

# Add WinForm assemblies
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

# Unzip assembly and method
Add-Type -AssemblyName System.IO.Compression.FileSystem

# Start here by showing the dialog.
Show-Dialog 


# Post deploy file clean-up
CleanUp