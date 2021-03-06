[CmdLetBinding()]
Param(
     [Parameter(Mandatory=$False,HelpMessage="Please enter computer Name")]
     [String]$ComputerName = "$env:Computername"
     )
Try{     
    $HoursQuery = Invoke-WmiMethod -Namespace "Root\ccm\ClientSDK" -Class CCM_ClientUXSettings -Name GetBusinessHours -ComputerName $ComputerName -ErrorAction STOP
}
Catch{
    Write-Host "Error: $($_.Exception.Message)"
}

Switch($HoursQuery.WorkingDays)
{
    1   {$WorkingDays ="Sunday"}
    2   {$WorkingDays ="Monday"}
    3   {$WorkingDays ="Sunday, Monday"}
    4   {$WorkingDays ="Tuesday"}
    5   {$WorkingDays ="Sunday, TuesDay"}
     6   {$WorkingDays ="Monday, Tuesday"}
     7   {$WorkingDays ="Sunday, Monday, Tuesday"}
     8   {$WorkingDays ="Wednesday"}
     9   {$WorkingDays ="Sunday, Wednesday"}
     10  {$WorkingDays ="Monday,Wednesday"}
     11  {$WorkingDays ="Sunday, Monday, Wednesday"}
     12  {$WorkingDays ="Tuesday, Wednesday"}
     13  {$WorkingDays ="Sunday, Tuesday, Wednesday"}
     14  {$WorkingDays ="Monday, Tuesday, Wednesday"}
     15  {$WorkingDays =" Sunday, Monday, Tuesday, Wednesday"}
     16  {$WorkingDays ="Thursday"}
     17  {$WorkingDays ="Sunday, Thursday"}
     18  {$WorkingDays =" Monday, Thursday"}
     19  {$WorkingDays ="Sunday, Monday, Thursday"}
     20  {$WorkingDays ="Tuesday,Thursday"}
     21  {$WorkingDays ="Sunday,Tuesday,Thursday"}
     22  {$WorkingDays ="Monday, Tuesday,Thursday"}
     23  {$WorkingDays ="Sunday, Monday, Tuesday,Thursday"}
     24  {$WorkingDays ="Wednesday, Thursday"}
     25  {$WorkingDays ="Sunday, Wednesday, Thursday"}
     26  {$WorkingDays ="Monday, Wednesday, Thursday"}
     27  {$WorkingDays ="Sunday, Monday, Wednesday, Thursday"}
     28  {$WorkingDays ="Tuesday, Wednesday, Thursday"}
     29  {$WorkingDays ="Sunday, Tuesday, Wednesday, Thursday"}
     30  {$WorkingDays ="Monday, Tuesday, Wednesday, Thursday"}
     31  {$WorkingDays ="Sunday, Monday, Tuesday, Wednesday, Thursday"}
     32  {$WorkingDays ="Friday"}
     33  {$WorkingDays ="Sunday, Friday"}
     34  {$WorkingDays ="Monday, Friday"}
     35  {$WorkingDays ="Sunday, Monday, Friday"}
     36  {$WorkingDays ="Tuesday, FriDay"}
     37  {$WorkingDays ="Sunday, Tuesday, FriDay"}
     38  {$WorkingDays ="Monday, Tuesday, FriDay"}
     39  {$WorkingDays ="Sunday,Monday, Tuesday, FriDay"}
     40  {$WorkingDays ="Wednesday, FriDay"}
     41  {$WorkingDays ="Sunday, Wednesday, FriDay"}
     42  {$WorkingDays ="Monday, Wednesday, FriDay"}
     43  {$WorkingDays ="Sunday, Monday, Wednesday, FriDay"}
     44  {$WorkingDays ="Tuesday, Wednesday, FriDay"}
     45  {$WorkingDays ="Sunday, Tuesday, Wednesday, FriDay"}
     46  {$WorkingDays ="Monday, Tuesday, Wednesday, FriDay"}
     47  {$WorkingDays ="Sunday, Monday,Tuesday, Wednesday, FriDay"}
     48  {$WorkingDays ="Thursday, FriDay"}
     49  {$WorkingDays ="Sunday, Thursday, FriDay"}
     50  {$WorkingDays ="Monday, Thursday, FriDay"}
     51  {$WorkingDays ="Sunday, Monday, Thursday, FriDay"}
     52  {$WorkingDays ="Tuesday, Thursday, FriDay"}
     53  {$WorkingDays ="Sunday, Tuesday, Thursday, FriDay"}
     54  {$WorkingDays ="Wednesday, Thursday, FriDay"}
     55  {$WorkingDays ="Sunday, Wednesday, Thursday, FriDay"}
     56  {$WorkingDays ="Wednesday, Thursday, FriDay"}
     57  {$WorkingDays ="Sunday, Wednesday, Thursday, FriDay"}
     58  {$WorkingDays ="Monday, Wednesday, Thursday, FriDay"}
     59  {$WorkingDays ="Sunday, Monday, Wednesday, Thursday, FriDay"}
     60  {$WorkingDays ="Tuesday, Wednesday, Thursday, FriDay"}
     61  {$WorkingDays ="Sunday, Tuesday, Wednesday, Thursday, FriDay"}
     62  {$WorkingDays ="Monday, Tuesday, Wednesday, Thursday, Friday"}
     63  {$WorkingDays ="Sunday, Monday, Tuesday, Wednesday, Thursday, Friday"}
     64  {$WorkingDays ="Saturday"}
     65  {$WorkingDays ="Sunday, Saturday"}
     66  {$WorkingDays ="Monday, Saturday"}
     67  {$WorkingDays ="Sunday, Monday, Saturday"}
     68  {$WorkingDays ="Tuesday, Saturday"}
     69  {$WorkingDays ="Sunday, Tuesday, Saturday"}
     70  {$WorkingDays ="Monday, Tuesday, Saturday"}
     71  {$WorkingDays ="Sunday, Monday, Tuesday, Saturday"}
     72  {$WorkingDays ="Wednesday, Saturday"}
     73  {$WorkingDays ="Sunday, Wednesday, Saturday"}
     74  {$WorkingDays ="Monday, Wednesday, Saturday"}
     75  {$WorkingDays ="Sunday, Monday, Wednesday, Saturday"}
     76  {$WorkingDays ="Tuesday, Wednesday, Saturday"}
     77  {$WorkingDays ="Sunday, Tuesday, Wednesday, Saturday"}
     78  {$WorkingDays ="Wednesday, Thursday, Saturday"}
     79  {$WorkingDays ="Sunday, Wednesday, Thursday, Saturday"}
     80  {$WorkingDays ="Thursday, Saturday"}
     81  {$WorkingDays ="Sunday, Thursday, Saturday"}
     82  {$WorkingDays ="Monday, Thursday, Saturday"}
     83  {$WorkingDays ="Sunday, Monday, Thursday, Saturday"}
     84  {$WorkingDays ="Tuesday, Thursday, Saturday"}
     85  {$WorkingDays ="Sunday, Tuesday, Thursday, Saturday"}
     86  {$WorkingDays ="Monday, Tuesday, Thursday, Saturday"}
     87  {$WorkingDays ="Sunday, Monday, Tuesday, Thursday, Saturday"}
     88  {$WorkingDays ="Wednesday, Thursday, Saturday"}
     89  {$WorkingDays ="Sunday, Wednesday, Thursday, Saturday"}
     90  {$WorkingDays ="Monday, Wednesday, Thursday, Saturday"}
     91  {$WorkingDays ="Sunday, Monday, Wednesday, Thursday, Saturday"}
     92  {$WorkingDays ="Tuesday, Wednesday, Thursday, Saturday"}
     93  {$WorkingDays ="Sunday, Tuesday, Wednesday, Thursday, Saturday"}
     94  {$WorkingDays ="Monday, Tuesday, Wednesday, Thursday, Saturday"}
     95  {$WorkingDays ="Sunday, Monday, Tuesday, Wednesday, Thursday, Saturday"}
     96  {$WorkingDays ="Friday, Saturday"}
     97  {$WorkingDays ="Sunday, Friday, Saturday"}
     98  {$WorkingDays ="Monday, Friday, Saturday"}
     99  {$WorkingDays ="Sunday, Monday, Friday, Saturday"}
     100  {$WorkingDays ="Tuesday, Friday, Saturday"}
     101  {$WorkingDays ="Sunday, Tuesday, Friday, Saturday"}
     102  {$WorkingDays ="Monday, Tuesday, Friday, Saturday"}
     103  {$WorkingDays ="Sunday, Monday, Tuesday, Friday, Saturday"}
     104  {$WorkingDays ="Wednesday, Friday, Saturday"}
     105  {$WorkingDays ="Sunday, Wednesday, Friday, Saturday"}
     106  {$WorkingDays ="Monday, Wednesday, Friday, Saturday"}
     107  {$WorkingDays ="Sunday, Monday, Wednesday, Friday, Saturday"}
     108  {$WorkingDays ="Tuesday, Wednesday, Friday, Saturday"}
     109  {$WorkingDays ="Sunday, Tuesday, Wednesday, Friday, Saturday"}
     110  {$WorkingDays ="Monday, Tuesday, Wednesday, Friday, Saturday"}
     111  {$WorkingDays ="Sunday, Monday, Tuesday, Wednesday, Friday, Saturday"}
     112  {$WorkingDays ="Thursday, Friday, Saturday"}
     113  {$WorkingDays ="Sunday, Thursday, Friday, Saturday"}
     114  {$WorkingDays ="Monday, Thursday, Friday, Saturday"}
     115  {$WorkingDays ="Sunday, Monday, Thursday, Friday, Saturday"}
     116  {$WorkingDays ="Tuesday, Thursday, Friday, Saturday"}
     117  {$WorkingDays ="Sunday, Tuesday, Thursday, Friday, Saturday"}
     118  {$WorkingDays ="Monday, Tuesday, Thursday, Friday, Saturday"}
     119  {$WorkingDays ="Sunday, Monday, Tuesday, Thursday, Friday, Saturday"}
     120  {$WorkingDays ="Wednesday, Thursday, Friday, Saturday"}
     121  {$WorkingDays ="Sunday, Wednesday, Thursday, Friday, Saturday"}
     122  {$WorkingDays ="Monday, Wednesday, Thursday, Friday, Saturday"}
     123  {$WorkingDays ="Sunday, Monday, Wednesday, Thursday, Friday, Saturday"}
     124  {$WorkingDays ="Tuesday, Wednesday,Thursday, Friday, Saturday"}
     125  {$WorkingDays ="Sunday, Tuesday, Wednesday,Thursday, Friday, Saturday"}
     126  {$WorkingDays ="Monday, Tuesday, Wednesday, Thursday, Friday, Saturday"}
     127  {$WorkingDays ="Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday"}

}

Write-Host " - Business Hours: From $($HoursQuery.StartTime) through $($HoursQuery.EndTime)`n - Days: $WorkingDays"

<#
1   Sunday
2   Monday
4 Tuesday
8 Wednesday
16 Thursday
32 Friday
64 Saturday
#>