Configuration MyFirstConfiguration {   
    Import-DscResource -ModuleName PsDesiredStateConfiguration
  
    Node "localhost" {
      
      # hello world from file
      File HelloWorld {
          DestinationPath = "C:\DSCtest.txt"
          Ensure = "Present"
          Contents   = "Test med DSC!"
      }
  
      # install IIS
      WindowsFeature MyFeatureInstance {
        Ensure = 'Present'
        Name = 'Web-Server'
      }
  
    }
  }

MyFirstConfiguration

#---------------
#run configuration on VM, find a way to shorten the path
Start-DscConfiguration -Path 'C:\Packages\Plugins\Microsoft.Compute.CustomScriptExtension\1.10.12\Downloads\0\MyFirstConfiguration' -Wait -Verbose 

# #install chocolatey
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
#iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
# #install python3:
choco install -y python3

#install .net sdk 5  
#choco install dotnet-5.0-sdk -y
choco install dotnet-5.0-sdk --silent -y
