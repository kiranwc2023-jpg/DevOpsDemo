<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 232px;
        }
    </style>
</head>
<table width="100%" border="0" cellspacing="0">
       <tr bgcolor="#00066">
		            <td valign="center">
		            <img src="./images/Kenexa.jpg" align=left width="150" height="50" border="0"/>
		             <td align="right" valign="center">
		            <font face=arial size="4" color="white"><b>KRB Deployment Email Notification </b></font>
		              	<td width='1%'>
		              </table>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="style1">
            <tr>
                <td class="style2">
                    <b>Envirnoment :</b></td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                        <asp:ListItem>Staging</asp:ListItem>
                        <asp:ListItem>Production</asp:ListItem>
                        <asp:ListItem>EU-Staging</asp:ListItem>
                        <asp:ListItem>EU-Production</asp:ListItem>
                        <asp:ListItem>CN-Production</asp:ListItem>
                        <asp:ListItem>TestStaging</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <b>Release Number :</b></td>
                <td>
                    
                    <asp:TextBox ID="rntxt" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Release Number" ControlToValidate="rntxt" Font-Bold="True" Font-Italic="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <b>Status :</b></td>
                <td>
                    <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="DropDownList2_SelectedIndexChanged">
                        <asp:ListItem>Starting</asp:ListItem>
                        <asp:ListItem>Finished</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                        Text="Preview" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    <asp:Panel ID="Panel1" runat="server" BorderColor="#FF6600" Height="358px" 
        Visible="False">
        <table class="style1" border="true">
            <tr>
                <td>
                    <b>From</b></td>
                <td>
                    <asp:TextBox ID="Ftxt" runat="server" Visible="False"></asp:TextBox>
                    <asp:Label ID="frmlbl" runat="server" ForeColor="#000099"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <b>To</b></td>
                <td>
                    <asp:TextBox ID="totxt" runat="server" Visible="False"></asp:TextBox>
                    <asp:Label ID="tolbl" runat="server" ForeColor="#000099"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <b>CC</b></td>
                <td>
                    <asp:TextBox ID="cctxt" runat="server" Visible="False"></asp:TextBox>
                    <asp:Label ID="cclbl" runat="server" ForeColor="#000099"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <b>Bcc</b></td>
                <td>
                    <asp:TextBox ID="bcctxt" runat="server" Visible="False"></asp:TextBox>
                    <asp:Label ID="bcclbl" runat="server" ForeColor="#000099"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                   <b> Subject</b></td>
                <td>
                    <asp:Label ID="sbjlbl" runat="server" ForeColor="#000099"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <b>Body</b></td>
                <td>
                    <asp:Label ID="blbl" runat="server" ForeColor="#000099"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="Button3" runat="server" Text="Send" onclick="Button3_Click" />
                </td>
                <td>
                    <asp:Label ID="oplbl" runat="server" Font-Bold="True" Font-Italic="True" 
                        ForeColor="#000099"></asp:Label>
                </td>
            </tr>
        </table>
    </asp:Panel>
    </form>
</body>
</html>
