Dim objFSO,ObjNet
Dim strUsername,strDestfile, strScriptLocation

strFileName = "cmtrace.exe"

strScriptLocation = Replace(WScript.ScriptFullName,WScript.ScriptName,"")

Set objShell = CreateObject("WScript.Shell")
Set objFSO = CreateObject("Scripting.FileSystemObject")

strAppData = objShell.ExpandEnvironmentStrings("%windir%")

strDestFolder = strAppData & "\system32\"

If Not objFSO.FolderExists(strDestFolder) Then
	objFSO.CreateFolder strDestFolder
End If


objFSO.Copyfile strScriptLocation & strFileName,strDestFolder&"\",True
