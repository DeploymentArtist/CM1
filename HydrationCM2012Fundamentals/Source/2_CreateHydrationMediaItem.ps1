Add-PSSnapIn Microsoft.BDD.PSSnapIn -ErrorAction SilentlyContinue 

md C:\HydrationCM2012Fundamentals\HydrationISO\Content\Deploy
New-PSDrive -Name "DS001" -PSProvider MDTProvider -Root "C:\HydrationCM2012Fundamentals\HydrationDS"
new-item -path "DS001:\Media" -enable "True" -Name "MEDIA001" -Comments "" -Root "C:\HydrationCM2012Fundamentals\HydrationISO" -SelectionProfile "Everything" -SupportX86 "True" -SupportX64 "False" -GenerateISO "True" -ISOName "HydrationCM2012Fundamentals.iso" -Verbose
new-PSDrive -Name "MEDIA001" -PSProvider "MDTProvider" -Root "C:\HydrationCM2012Fundamentals\HydrationISO\Content\Deploy" -Description "Embedded media deployment share" -Force -Verbose