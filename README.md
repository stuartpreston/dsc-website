# Example Chef/DSC stuff

1. Takes the useful bits of dsc_contrib and imports them into a library
2. Example converge output:
```
C:\projects\repro\dsc-website [master +4 ~2 -0 !]> kitchen converge
-----> Starting Kitchen (v2.3.3)
-----> Converging <default-windows2019>...
       Preparing files for transfer
       Preparing dna.json
       Preparing cookbooks from project directory
       Removing non-cookbook files before transfer
       Preparing nodes
       Preparing validation.pem
       Preparing client.rb
-----> Installing Chef install only if missing package
       Downloading package from https://packages.chef.io/files/stable/chef/15.3.14/windows/2019/chef-client-15.3.14-1-x64.msi
       Download complete.
       Successfully verified C:\Users\azure\AppData\Local\Temp\chef-client-15.3.14-1-x64.msi
       Installing Chef package C:\Users\azure\AppData\Local\Temp\chef-client-15.3.14-1-x64.msi
       Installation complete
       Transferring files to <default-windows2019>
       +---------------------------------------------+
       âœ” 2 product licenses accepted.
       +---------------------------------------------+
       Starting Chef Infra Client, version 15.3.14
       Creating a new client identity for default-windows2019 using the validator key.
       resolving cookbooks for run list: ["mywebsite::default"]
       Synchronizing Cookbooks:
         - mywebsite (0.1.0)
       Installing Cookbook Gems:
       Compiling Cookbooks...
       Converging 5 resources
       Recipe: mywebsite::default
         * dsc_resource[Install IIS] action run
           - Perform operation 'Invoke CimMethod' with following parameters, ''methodName' = Resourcetest,'className' =

           MSFT_DSCLocalConfigurationManager,'namespaceName' = root/Microsoft/Windows/DesiredStateConfiguration'.

           An LCM method call arrived from computer vm with user sid S-1-5-21-1037389898-3520285118-2311172459-500.

           [vm]: LCM:  [ Start  Test     ]  [[WindowsFeature]DirectResourceAccess]

           [vm]:                            [[WindowsFeature]DirectResourceAccess] The operation 'Get-WindowsFeature' started:

           web-server

           [vm]:                            [[WindowsFeature]DirectResourceAccess] The operation 'Get-WindowsFeature' succeeded:

           Web-Server

           [vm]: LCM:  [ End    Test     ]  [[WindowsFeature]DirectResourceAccess] False in 1.8590 seconds.

           [vm]: LCM:  [ End    Set      ]    in  2.5000 seconds.

           Operation 'Invoke CimMethod' complete.

           Time taken for configuration job to complete is 3.723 seconds


           Perform operation 'Invoke CimMethod' with following parameters, ''methodName' = Resourceset,'className' =

           MSFT_DSCLocalConfigurationManager,'namespaceName' = root/Microsoft/Windows/DesiredStateConfiguration'.

           An LCM method call arrived from computer vm with user sid S-1-5-21-1037389898-3520285118-2311172459-500.

           [vm]: LCM:  [ Start  Set      ]  [[WindowsFeature]DirectResourceAccess]

           [vm]:                            [[WindowsFeature]DirectResourceAccess] Installation started...

           [vm]:                            [[WindowsFeature]DirectResourceAccess] Continue with installation?

           [vm]:                            [[WindowsFeature]DirectResourceAccess] Prerequisite processing started...

           [vm]:                            [[WindowsFeature]DirectResourceAccess] Prerequisite processing succeeded.

           [vm]:                            [[WindowsFeature]DirectResourceAccess] Installation succeeded.

           [vm]:                            [[WindowsFeature]DirectResourceAccess] Successfully installed the feature web-server.

           [vm]: LCM:  [ End    Set      ]  [[WindowsFeature]DirectResourceAccess]  in 75.4610 seconds.

           [vm]: LCM:  [ End    Set      ]    in  75.5390 seconds.

           Operation 'Invoke CimMethod' complete.

           Time taken for configuration job to complete is 75.815 seconds


         * powershell_package_source[PSGallery] action register (up to date)
         * powershell_package[xWebAdministration] action install
           - install version 2.8.0.0 of package xWebAdministration
         * directory[c:\inetpub\mywebsite] action create
           - create new directory c:\inetpub\mywebsite
         * dsc_resource[mywebsite] action run
           - Perform operation 'Invoke CimMethod' with following parameters, ''methodName' = Resourcetest,'className' =

           MSFT_DSCLocalConfigurationManager,'namespaceName' = root/Microsoft/Windows/DesiredStateConfiguration'.

           An LCM method call arrived from computer vm with user sid S-1-5-21-1037389898-3520285118-2311172459-500.

           [vm]: LCM:  [ Start  Test     ]  [[xWebsite]DirectResourceAccess]

           [vm]:                            [[xWebsite]DirectResourceAccess] The Ensure state for website "mywebsite" does not

           match the desired state.

           [vm]:                            [[xWebsite]DirectResourceAccess] The target resource is not in the desired state.

           [vm]: LCM:  [ End    Test     ]  [[xWebsite]DirectResourceAccess] False in 1.3120 seconds.

           [vm]: LCM:  [ End    Set      ]    in  1.8280 seconds.

           Operation 'Invoke CimMethod' complete.

           Time taken for configuration job to complete is 1.966 seconds


           Perform operation 'Invoke CimMethod' with following parameters, ''methodName' = Resourceset,'className' =

           MSFT_DSCLocalConfigurationManager,'namespaceName' = root/Microsoft/Windows/DesiredStateConfiguration'.

           An LCM method call arrived from computer vm with user sid S-1-5-21-1037389898-3520285118-2311172459-500.

           [vm]: LCM:  [ Start  Set      ]  [[xWebsite]DirectResourceAccess]

           [vm]:                            [[xWebsite]DirectResourceAccess] Performing the operation "Set Item" on target "Item:

           ConfirmPreference Value: High".

           [vm]:                            [[xWebsite]DirectResourceAccess] Performing the operation "Set Item" on target "Item:

           ConfirmPreference Value: High".

           [vm]:                            [[xWebsite]DirectResourceAccess] Successfully created website "mywebsite".

           [vm]:                            [[xWebsite]DirectResourceAccess] Bindings for website "mywebsite" have been updated.

           [vm]:                            [[xWebsite]DirectResourceAccess] Successfully started website "mywebsite".

           [vm]:                            [[xWebsite]DirectResourceAccess] LogCustomFields is not in the desired state and will

           be updated on Website "mywebsite"

           [vm]: LCM:  [ End    Set      ]  [[xWebsite]DirectResourceAccess]  in 2.7680 seconds.

           [vm]: LCM:  [ End    Set      ]    in  2.8150 seconds.

           Operation 'Invoke CimMethod' complete.

           Time taken for configuration job to complete is 2.956 seconds



       Running handlers:
       Running handlers complete
       Chef Infra Client finished, 4/5 resources updated in 02 minutes 12 seconds
       Downloading files from <default-windows2019>
       Finished converging <default-windows2019> (4m48.63s).
-----> Kitchen is finished. (4m56.18s)
```
