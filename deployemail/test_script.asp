<%

      '#-------------------------------------------------------------------------
      Dim rs : rs = ""
      Dim oParts

     

      '#-------------------------------------------------------------------------
      On Error Resume Next

      '#-------------------------------------------------------------------------
      '*** TFS ***'
      '#-------------------------------------------------------------------------
      Dim Project    
      Dim Branch     
      Dim TFSServer  
      Dim TFSGet    

      

      '#-------------------------------------------------------------------------
      'Dim WSHShell : Set WSHShell = CreateObject("WScript.Shell")
      TFSGet="C:\TFSGet\bin\Debug\TFSGet.exe"

      TFSServer="http://tfs01.corp.swglab.ibm.com:8080/"

      pathSpec="$/KRBDatabase/Database-DEV/DataModel11.0/Version 11.00.1314"

      sScript="Hireflow_std_11.00.1314.006"

      outPath="C:\inetpub\wwwroot\scm\file"


      strCmd = Chr(34) & TFSGet &  Chr(34)
      strCmd = strCmd & " /s " & Chr(34) & TFSServer &  Chr(34)
      strcmd = strCmd & " /p " & Chr(34) & pathSpec  &  Chr(34)
      strCmd = strCmd & " /f " & Chr(34) & sScript   &  Chr(34)
      strCmd = strCmd & " /o " & Chr(34) & outPath   & Chr(34)

      'strCmd="E:\Buildsite\TestDBATools\SCM\file\testtfs.bat"
	  startTime = Timer( )
        quit = False
        'rs = ""
		'Response.Write "<p>" & strCmd
        Set objShell = Server.CreateObject("WScript.Shell")
        Set objCmd = objShell.Exec(strCmd)
        WScript.Sleep 100
        Do
        If Not objCmd.StdOut.AtEndOfStream Then
        rs = rs & objCmd.StdOut.ReadLine
        End If
        If objCmd.Status = 1 Then Exit Do
        If timer( ) > startTime + 20 Then
        rs = rs '& vbNewLine & "*** TIMED OUT ***"
        Exit Do
        End If
        WScript.Sleep 100
        Loop
        endTime = Timer( )

        Set oExec = Nothing
        'Set WSHShell = Nothing
Response.Write "<p>" & strCmd
        '#-------------------------------------------------------------------------
        If Len(rs & "") = 0 Then
        Dim filesys : Set filesys = CreateObject("Scripting.FileSystemObject")
        Dim Folder: Set Folder = fso.GetFolder(outPath)
        Dim Files: Set Files = Folder.Files
        Dim File

        For Each File In Files
        If InStr(UCase(File.Name), Ucase(sScript)) > 0 Then
        'Set CheckOutScriptFromTFSLocal = File
        End If
        Next
        End If

        '#-------------------------------------------------------------------------
        On Error GoTo 0

        '#-------------------------------------------------------------------------
        'oParts.RemoveAll()

        Set oParts       = Nothing
        '#-------------------------------------------------------------------------
		
'Set objShell = Server.CreateObject("WScript.Shell")
'objShell.Run("")
'Set objCmd = objShell.Exec(strCmd)
'Set oExec = objShell.Exec("c:\windows\system32\cmd.exe /c " & strCmd & " > C:\temp\t.log 2>&1")
'Set objCmd = objShell.Exec(strCmd)
 
	  'Response.End

        'Dim WSHShell : Set WSHShell = CreateObject("WScript.Shell")
        'debug
        'Dim oExec : Set oExec = WSHShell.Exec("c:\windows\system32\cmd.exe /c " & strCmd & " > c:\t.log 2>&1")

       ' Dim oExec : Set oExec = WSHShell.Exec("c:\windows\system32\cmd.exe /c " & "notepad")

        'Response.Write "<p>" & strCmd
        'Dim oExec : Set oExec = WSHShell.Exec(strCmd)


        'strUser="THESYSTEM\kmantri"
       ' strPass="tendulkar@3"

        'strCmd=  "cmd /c " " -u " & strUser & " -p " & strPass
        'Dim oExec : Set oExec = WSHShell.Exec("c:\windows\system32\cmd.exe /c " " -u " & strUser & " -p " & strPass & " & strCmd)
'Response.Write "<p>" & strCmd
'Response.End
        'Dim oExec : Set oExec = WSHShell.RUN(strCmd)

        'Dim oExec : Set oExec = WSHShell.Exec(strCmd)



        'startTime = Timer( )
        'quit = False
       ' rs = ""

        'Set objShell = CreateObject("WScript.Shell")
        'Set objCmd = objShell.Exec(strCmd)
        'Do
        'If Not objCmd.StdOut.AtEndOfStream Then
        'rs = rs & objCmd.StdOut.ReadLine
        'End If
        'If objCmd.Status = 1 Then Exit Do
        'If timer( ) > startTime + 20 Then
        'rs = rs '& vbNewLine & "*** TIMED OUT ***"
        'Exit Do
        'End If
        'WScript.Sleep 100
       ' Loop
       ' endTime = Timer( )

       
        '#-------------------------------------------------------------------------
%>
      