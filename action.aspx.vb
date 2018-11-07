Imports System.Net

Partial Class login
    Inherits System.Web.UI.Page

    Protected Sub Page_PreInit(sender As Object, e As System.EventArgs) Handles Me.PreInit
        Dim destination As String = "agents.html"
        If Request.QueryString("action") IsNot Nothing Then
            If Request.QueryString("action") = "logout" Then
                Session.Remove("UserName")
                Response.Redirect("~/" & destination, True)
            ElseIf Request.QueryString("action") = "contact" Then
                Dim rq As HttpWebRequest = HttpWebRequest.Create("http://www.google.com/recaptcha/api/verify")
                rq.Method = "POST"
                rq.UserAgent = "reCAPTCHA/ASP.NET"
                rq.ContentType = "application/x-www-form-urlencoded"

                Try
                    Dim rqStream As System.IO.Stream = rq.GetRequestStream()
                    Dim sw As New System.IO.StreamWriter(rqStream)
                    sw.Write("privatekey=")
                    'replace with your Recapcha Private key
                    sw.Write(Server.UrlEncode("6LdQcM4SAAAAAEucg4yw8LWI2Vcxq-gC5zBerhaV"))
                    'sw.Write(Server.UrlEncode("6LdMcM4SAAAAAO925vKCkYV8gI4gPJWaOIT5vmzi"))
                    sw.Write("&remoteip=")
                    sw.Write(Server.UrlEncode(Request.UserHostAddress))
                    sw.Write("&chalenge=")
                    sw.Write(Server.UrlEncode(Request.Form("recaptcha_challenge_field")))
                    sw.Write("&response=")
                    sw.Write(Server.UrlEncode(Request.Form("recaptcha_response_field")))
                    sw.Close()
                    Dim rs As HttpWebResponse = rq.GetResponse()
                    Dim sr As New System.IO.StreamReader(rs.GetResponseStream())
                    Dim rsString As String = sr.ReadToEnd()
                    Dim res() As String = rsString.Split(vbLf)
                    If res(0) = "true" Then
                        Dim srEmail As New System.IO.StreamReader(Server.MapPath("~/emailContact.htm.config"))
                        Dim strEmail As String = srEmail.ReadToEnd()
                        srEmail.Close()
                        strEmail = strEmail.Replace("{{first_name}}", Request.Form("first_name"))
                        strEmail = strEmail.Replace("{{last_name}}", Request.Form("last_name"))
                        strEmail = strEmail.Replace("{{email}}", Request.Form("email"))
                        If Request.Form("is_list") IsNot Nothing Then
                            strEmail = strEmail.Replace("{{is_list}}", Request.Form("is_list"))
                        Else
                            strEmail = strEmail.Replace("{{is_list}}", "not provided")
                        End If
                        If Request.Form("is_vacant") IsNot Nothing Then
                            strEmail = strEmail.Replace("{{is_vacant}}", Request.Form("is_vacant"))
                        Else
                            strEmail = strEmail.Replace("{{is_vacant}}", "not provided")
                        End If
                        If Request.Form("footage") IsNot Nothing Then
                            strEmail = strEmail.Replace("{{footage}}", Request.Form("footage"))
                        Else
                            strEmail = strEmail.Replace("{{footage}}", "not provided")
                        End If
                        If Request.Form("comments") IsNot Nothing Then
                            strEmail = strEmail.Replace("{{comments}}", Request.Form("comments"))
                        Else
                            strEmail = strEmail.Replace("{{comments}}", "")
                        End If
                        Dim userInfo As String = "User IP: " & Request.UserHostAddress & "<br>User Agent: " & Request.UserAgent
                        strEmail = strEmail.Replace("{{user_info}}", userInfo)

                        Dim mail As New Net.Mail.MailMessage("marcyne@domainestaging.com", "marcyne@domainestaging.com")
                        mail.Subject = "Contact Form"
                        mail.IsBodyHtml = True
                        mail.Body = strEmail

                        Dim client As New System.Net.Mail.SmtpClient()
                        Try
                            client.Send(mail)
                            Response.Redirect("~/thank-you.html", True)
                        Catch ex As Exception
                            Response.Redirect("~/contact.html?" & ex.Message, True)
                        End Try

                    ElseIf res.Length > 1 Then
                        Response.Redirect("~/contact.html?" & res(1), True)

                    End If
                Catch ex As Exception

                End Try
            End If
        End If
        If Request.Form("username") IsNot Nothing AndAlso Request.Form("password") IsNot Nothing Then
            Try
                Dim un As String = Request.Form("username")
                Dim pwd As String = Request.Form("password")
                Dim xDoc As New System.Xml.XmlDocument()
                xDoc.Load(Server.MapPath("~/users.config"))
                Dim userNode As System.Xml.XmlNode = Nothing
                Dim xUsers As System.Xml.XmlNodeList = xDoc.SelectNodes("users/user")
                For Each n As System.Xml.XmlNode In xUsers
                    If n.Attributes("name").Value.ToLower() = un.ToLower() Then 'User name is case-insensitive
                        userNode = n
                        Exit For
                    End If
                Next
                If userNode IsNot Nothing Then
                    Dim xPwd As String = userNode.Attributes("password").Value
                    If String.Compare(xPwd, pwd, False) = 0 Then 'password is case-sensitive
                        destination = "membersonly.aspx"
                        Session("UserName") = un
                    End If
                End If
            Catch ex As Exception
            End Try
        End If
        Response.Redirect("~/" & destination, True)
    End Sub
End Class
