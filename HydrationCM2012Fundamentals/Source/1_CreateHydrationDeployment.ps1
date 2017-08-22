$MDTServer = (get-wmiobject win32_computersystem).Name

Add-PSSnapIn Microsoft.BDD.PSSnapIn -ErrorAction SilentlyContinue 
md C:\HydrationCM2012Fundamentals\HydrationDS
new-PSDrive -Name "DS001" -PSProvider "MDTProvider" -Root "C:\HydrationCM2012Fundamentals\HydrationDS" -Description "Hydration CM2012 Fundamentals" -NetworkPath "\\$MDTServer\HydrationCM2012Fundamentals$" -Verbose | add-MDTPersistentDrive -Verbose