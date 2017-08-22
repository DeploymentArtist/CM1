option explicit
dim CRLF: CRLF=chr(13) & chr(10)

dim WSH: set WSH = CreateObject("WScript.Shell")
dim FSO: set FSO = CreateObject("Scripting.FileSystemObject")

dim WMI: set WMI = GetObject("winmgmts:/root/SMS")
dim Prov: set Prov = nothing
dim I, f

for each I in WMI.ExecQuery("select * from SMS_ProviderLocation where ProviderForLocalSite=TRUE")
    set Prov = I
next    
if Prov is nothing then err.Raise 438,"No provider found for the local site"

dim SiteCode: SiteCode = Prov.SiteCode
dim SiteServer: SiteServer = Prov.Machine

set WMI = GetObject("winmgmts:" & Prov.NamespacePath)

dim Pkg
for each Pkg in WMI.ExecQuery("select * from SMS_SoftwareUpdatesPackage")
	Log "Processing package " & Pkg.PackageID & " - " & Pkg.Name
	' remove orphaned package-to-content relations (not associated with CIs)
	for each i in WMI.ExecQuery("select pc.* from SMS_PackageToContent pc left join SMS_CIToContent cc on cc.ContentID=pc.ContentID where pc.PackageID=""" & Pkg.PackageID & """ and cc.ContentID is null")
		i.Delete_
	next
	
	Log "Package source path: " & Pkg.PkgSourcePath
	dim srcFolder: set srcFolder = FSO.GetFolder(Pkg.PkgSourcePath)
    dim foldersToDelete: set foldersToDelete = CreateObject("Scripting.Dictionary")
	foldersToDelete.CompareMode = vbTextCompare
	
	' collect subfolders currently in pkg source
    for each i in srcFolder.SubFolders
		if i.Attributes=16 and i.Name<>"." and i.Name<>".." then 
            'Log "Existing folder " & i.Name
            foldersToDelete.Add i.Name, nothing
        end if
	next
	' exclude subfolders associated with active content
	for each i in WMI.ExecQuery("select pc.* from SMS_PackageToContent pc where pc.PackageID=""" & Pkg.PackageID & """")
        'Log "Excluding active folder " & i.ContentSubFolder
		if foldersToDelete.Exists(i.ContentSubFolder) then foldersToDelete.Remove(i.ContentSubFolder)
	next
	
	f = vbFalse
	' delete remaining folders
	for each i in srcFolder.SubFolders
        if foldersToDelete.EXists(i.NAme) then
            Log "Deleting orphaned subfolder " & i.name
            i.Delete
            f = vbTrue
        end if 
	next
	if f = vbTrue then
        Log "Refreshing package " & pkg.PackageID
        pkg.RefreshPKgSource
	end if
next
Log "cleanup completed"

'================== logging support ==============
dim logMode
dim logWindow

sub Log(msg)
	if IsEmpty(logWindow) then call LogInit
	select case logMode
		case "console":	WScript.StdOut.WriteLine msg
		case "window":	if IsObject(logWindow) then logWindow.document.all.logLines.innerHtml = logWindow.document.all.logLines.innerHTML & msg & "<br/>"
	end select
end sub

sub LogInit
	if not WScript.Interactive then
		logMode = "none"
	elseif lcase(right(WScript.FullName, 11))="cscript.exe" then
		logMode = "console"
	else
		set logWindow = WScript.CreateObject("InternetExplorer.Application", "Log_")
		with logWindow
			.Navigate("about:blank")
			.Document.Title = WScript.ScriptName
			.AddressBar = false
			.ToolBar = false
			.StatusBar = false
			.Resizable = true
			.Visible = 1
			do while .Busy: WScript.Sleep 100: loop
			.document.body.innerHTML = "<div id=""logLines"" style=""font:10pt sans-serif;text-align:left;"" />"
		end with
		logMode = "window"
	end if
end sub

sub LogTerm
	if IsObject(logWindow) then logWindow.Quit: set logWindow = nothing
end sub

' provide a way of terminating the script in windowed mode - closing the log window will terminate the script
sub Log_onQuit
	WScript.Quit
end sub
