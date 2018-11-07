<%@ Page Language="VB" AutoEventWireup="false" CodeFile="contact.aspx.vb" Inherits="contact" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Domaine Staging | home stager in Charlotte, NC |</title>
    <link href="css/global.css" rel="stylesheet" type="text/css" />
    <!--[if IE 6]>
<link rel="stylesheet" type="text/css" href="css/ie6.css">
<![endif]-->
    <!--[if IE 7]>
<link rel="stylesheet" type="text/css" href="css/ie7.css">
<![endif]-->
    <script type="text/JavaScript">
<!--
        function MM_preloadImages() { //v3.0
            var d = document; if (d.images) {
                if (!d.MM_p) d.MM_p = new Array();
                var i, j = d.MM_p.length, a = MM_preloadImages.arguments; for (i = 0; i < a.length; i++)
                    if (a[i].indexOf("#") != 0) { d.MM_p[j] = new Image; d.MM_p[j++].src = a[i]; } 
            }
        }

        function MM_swapImgRestore() { //v3.0
            var i, x, a = document.MM_sr; for (i = 0; a && i < a.length && (x = a[i]) && x.oSrc; i++) x.src = x.oSrc;
        }

        function MM_findObj(n, d) { //v4.01
            var p, i, x; if (!d) d = document; if ((p = n.indexOf("?")) > 0 && parent.frames.length) {
                d = parent.frames[n.substring(p + 1)].document; n = n.substring(0, p);
            }
            if (!(x = d[n]) && d.all) x = d.all[n]; for (i = 0; !x && i < d.forms.length; i++) x = d.forms[i][n];
            for (i = 0; !x && d.layers && i < d.layers.length; i++) x = MM_findObj(n, d.layers[i].document);
            if (!x && d.getElementById) x = d.getElementById(n); return x;
        }

        function MM_swapImage() { //v3.0
            var i, j = 0, x, a = MM_swapImage.arguments; document.MM_sr = new Array; for (i = 0; i < (a.length - 2); i += 3)
                if ((x = MM_findObj(a[i])) != null) { document.MM_sr[j++] = x; if (!x.oSrc) x.oSrc = x.src; x.src = a[i + 2]; }
        }
//-->
    </script>
    <style type="text/css">
#content-container [type="text"],#content-container [type="password"],
#content-container textarea {border:1px solid #EEAF00;width:151px;}
.left-col{text-align:right;padding:0 2px;}
#recaptcha_widget_div{float:right;}
.error{background:#fdd;}
.error-summary{color:#f00;padding:0 40px;}
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="site-wrapper">
        <div id="logo-container">
            <img alt="Domaine Staging™" class="logo" src="imagesDS/logo.gif" title="Domaine Staging™" /><img
                alt="Life's a stage. Stage it right." class="slogan" src="imagesDS/slogan.gif"
                title="Life's a stage. Stage it right." /></div>
        <div id="top-coners">
            <ul>
                <li><a href="index.html">HOME</a></li>
                <span>|</span>
                <li><a href="stagingtosell.html">STAGING</a></li>
                <span>|</span>
                <li><a href="about.html">ABOUT</a></li>
                <span>|</span>
                <li><a href="portfolio.html">PORTFOLIO</a></li>
                <span>|</span>
                <li><a href="press.html">PRESS</a></li>
                <span>|</span>
                <li><a href="agents.html">RE AGENTS</a></li>
                <span>|</span>
                <li><a href="partners.html">PARTNERS</a></li>
                <span>|</span>
                <li><a href="faq.html">FAQ</a></li>
                <span>|</span>
                <li><a href="contact.aspx">CONTACT</a></li>
            </ul>
        </div>
        <div class="clear">
        </div>
        
        <div id="content-container">
        <div id="faq" class="faq_txt">
                <h1>
                    CONTACT DOMAINE STAGING&reg;</h1>
                <p>&nbsp;
                    </p>
                <p>
                    <strong>Phone: 704.905.6343 or Email us below.</strong></p>
            </div>
        <asp:Panel ID="pnlForm" runat="server">
<asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="error-summary" />
          <table align="center" cellpadding="0" cellspacing="5">
                <tr>
                    <td class="left-col">
                        First Name:
                    </td>
                    <td>
                        <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="valFirstName" ControlToValidate="txtFirstName" Display="Dynamic" runat="server" ErrorMessage="First Name is required">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="left-col">
                        Last Name:
                    </td>
                    <td>
                        <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="valLastName" ControlToValidate="txtLastName" Display="Dynamic" runat="server" ErrorMessage="Last Name is required">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="left-col">
                        Email:
                    </td>
                    <td>
                         <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="valEmail" ControlToValidate="txtEmail" Display="Dynamic" runat="server" ErrorMessage="Email is required">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td valign="top" class="left-col">
                        Is your property listed?
                    </td>
                    <td>
                        <asp:RadioButtonList ID="lstList" runat="server">
                        <asp:ListItem Value="yes" Text="Yes"></asp:ListItem>
                        <asp:ListItem Value="no" Text="No"></asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="valList" ControlToValidate="lstList" Display="Dynamic" runat="server" ErrorMessage="Is your property list?">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td valign="top" class="left-col">
                        Is your property
                    </td>
                    <td>
                        <asp:RadioButtonList ID="lstVacant" runat="server">
                        <asp:ListItem Value="vacant" Text="Vacant"></asp:ListItem>
                        <asp:ListItem Value="occupied" Text="Occupied"></asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="valVacant" ControlToValidate="lstVacant" Display="Dynamic" runat="server" ErrorMessage="Is your property Vacant/Occupied?">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="left-col">
                        What is the square footage of your home?
                    </td>
                    <td>
                         <asp:TextBox ID="txtFootage" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="valFootage" ControlToValidate="txtFootage" runat="server" ErrorMessage="Enter numbers only" ValidationExpression="^\d{1,4}$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td valign="top" class="left-col">
                        Comments/questions:
                    </td>
                    <td>
                         <asp:TextBox ID="txtComment" TextMode="MultiLine" Columns="50" Rows="10" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right;">
                    Enter security code you see here.
                    </td>
                    <td>
                    <asp:Image ID="imgSec" runat="server" ImageUrl="~/pic.aspx" style="float:left;" AlternateText="Security Code" />
                    <asp:TextBox ID="txtSec" runat="server" Width="50px" style="float:left;margin-left:61px;"></asp:TextBox>
                        <asp:CustomValidator ID="valSec" ControlToValidate="txtSec" Display="Dynamic" runat="server" ErrorMessage="Wrong Security Code">*</asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center;">&nbsp;</td>
                    <td style="text-align: center;"><asp:Button ID="btnSubmit" runat="server" Text="SUBMIT" /></td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="pnlThankYou" runat="server" Visible="false">
        <p>Thank you for your message.</p>
        </asp:Panel>
            
            <div id="press-logos">
                &nbsp;
            </div>
        </div>
        <div id="footer">
            <p><strong>704.905.6343&nbsp;&nbsp;</strong></p>
            <p class="right">
                © Copyright 2012. Domaine Staging LLC. All rights reserved.<br />
                <a href="http://www.upstreamwebdesign.com/" target="_blank">Upstream Web Design</a></p>
        </div>
    </div>
    </form>
</body>
</html>
