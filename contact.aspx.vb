
Partial Class contact
    Inherits System.Web.UI.Page

    Protected Sub btnSubmit_Click(sender As Object, e As System.EventArgs) Handles btnSubmit.Click

        If Page.IsValid Then
            Dim srEmail As New System.IO.StreamReader(Server.MapPath("~/emailContact.htm.config"))
            Dim strEmail As String = srEmail.ReadToEnd()
            srEmail.Close()
            strEmail = strEmail.Replace("{{first_name}}", txtFirstName.Text)
            strEmail = strEmail.Replace("{{last_name}}", txtLastName.Text)
            strEmail = strEmail.Replace("{{email}}", txtEmail.Text)
            If lstList.SelectedIndex > -1 Then
                strEmail = strEmail.Replace("{{is_list}}", lstList.SelectedValue)
            Else
                strEmail = strEmail.Replace("{{is_list}}", "not provided")
            End If
            If lstVacant.SelectedIndex > -1 Then
                strEmail = strEmail.Replace("{{is_vacant}}", lstVacant.SelectedValue)
            Else
                strEmail = strEmail.Replace("{{is_vacant}}", "not provided")
            End If
            If Not String.IsNullOrEmpty(txtFootage.Text) Then
                strEmail = strEmail.Replace("{{footage}}", txtFootage.Text)
            Else
                strEmail = strEmail.Replace("{{footage}}", "not provided")
            End If
            If Not String.IsNullOrEmpty(txtComment.Text) Then
                strEmail = strEmail.Replace("{{comments}}", txtComment.Text)
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
            'client.EnableSsl = True
            Try
                client.Send(mail)
                pnlForm.Visible = False
                pnlThankYou.Visible = True
                'Response.Redirect("~/thank-you.html", True)
            Catch ex As Exception
                'Response.Redirect("~/contact.html?" & ex.Message, True)
            End Try


        Else

        End If

    End Sub

    Protected Sub valSec_ServerValidate(source As Object, args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles valSec.ServerValidate
        If args.Value = Session("secCode") Then
            args.IsValid = True
        Else
            args.IsValid = False
        End If
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As System.EventArgs) Handles Me.PreRender
        txtSec.Text = ""
    End Sub
End Class
