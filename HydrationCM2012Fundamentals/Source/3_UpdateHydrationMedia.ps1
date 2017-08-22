Add-PSSnapIn Microsoft.BDD.PSSnapIn -ErrorAction SilentlyContinue 

New-PSDrive -Name "DS001" -PSProvider MDTProvider -Root "C:\HydrationCM2012Fundamentals\HydrationDS"
Update-MDTMedia -path "DS001:\Media\MEDIA001" -Verbose
