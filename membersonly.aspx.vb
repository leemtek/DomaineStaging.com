
Partial Class membersonly
    Inherits System.Web.UI.Page

    Protected Sub Page_PreInit(sender As Object, e As System.EventArgs) Handles Me.PreInit
        If Session("UserName") Is Nothing Then
            Response.Redirect("agents.html", True)
        End If
    End Sub
End Class
