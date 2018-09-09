<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserEntry.ascx.cs" Inherits="FriscoRaffle.UserEntry" %>
<link href="../Styles/StyleSheet_UserEntry.css" rel="stylesheet" />
<script src="../JavaScript/JavaScript.js"></script>
<link href="../Content/bootstrap-theme.css" rel="stylesheet" />
<body>
    <asp:ScriptManager ID="scmUserEntry" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <div style="Width:30%;">
            <div class="box top left">
                <div class="col-lg-8 col-xs-12 col-centered">
                    <asp:Label ID="lblFirst" runat="server" Text="First Name" Font-Bold="True" Font-Names="Franklin Gothic Book" Font-Size="Small"></asp:Label><br />
                    <asp:TextBox ID="txtFirst" runat="server" CssClass="responsiveTextbox" Font-Names="Franklin Gothic Book"></asp:TextBox>
                </div>
            </div>
            <div class="box top lastName">
                <div class="col-lg-8 col-xs-12 col-centered">
                    <asp:Label ID="lblLast" runat="server" Text="Last Name" Font-Bold="True" Font-Names="Franklin Gothic Book" Font-Size="Small"></asp:Label><br />
                    <asp:TextBox ID="txtLast" runat="server" CssClass="responsiveTextbox" Font-Names="Franklin Gothic Book"></asp:TextBox>
                </div>
            </div>
            <div class="box left phoneNumber">
                <div class="col-lg-8 col-xs-12 col-centered">
                    <asp:Label ID="lblPhone" runat="server" Text="Phone Number" Font-Bold="True" Font-Names="Franklin Gothic Book" Font-Size="Small"></asp:Label><br />
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="responsiveTextbox" Font-Names="Franklin Gothic Book"></asp:TextBox>
                </div>
            </div>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>
</body>


