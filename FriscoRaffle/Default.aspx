<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Default.aspx.cs" Inherits="FriscoRaffle.Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Src="~/Controls/UserEntry.ascx" TagPrefix="uc1" TagName="UserEntry" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        function txtChk() {
            var txtFirst = document.getElementById("<%=txtFirst.ClientID%>");
            var lblFirst = document.getElementById("<%=lblFirst.ClientID%>");
            var txtLast = document.getElementById("<%=txtLast.ClientID%>");
            var lblLast = document.getElementById("<%=lblLast.ClientID%>");
            var txtPhone = document.getElementById("<%=txtPhone.ClientID%>");
            var lblPhone = document.getElementById("<%=lblPhone.ClientID%>");
            var txtEmail = document.getElementById("<%=txtEmail.ClientID%>");
            var lblEmail = document.getElementById("<%=lblEmail.ClientID%>");
            var rdbYes = document.getElementById("<%=rdbYes.ClientID%>");
            var rdbNo = document.getElementById("<%=rdbNo.ClientID%>");
            var lblReferral = document.getElementById("<%=lblReferral.ClientID%>");

            var controls = 0;

            if (txtFirst.value == "") {
                lblFirst.style.color = "Red";
                lblFirst.innerHTML = "*First Name";
            }
            else {
                controls += 1;
            }

            if (txtLast.value == "") {
                lblLast.style.color = "Red";
                lblLast.innerHTML = "*Last Name";
            }
            else {
                controls += 1;
            }

            if (txtPhone.value == "") {
                lblPhone.style.color = "Red";
                lblPhone.innerHTML = "*Phone Number";
            }
            else {
                controls += 1;
            }

            if (txtEmail.value == "") {
                lblEmail.style.color = "Red";
                lblEmail.innerHTML = "*Email";
            }
            else {
                controls += 1;
            }

            if (rdbYes.checked == false && rdbNo.checked == false) {
                lblReferral.innerHTML = "*Please select one";
            }
            else {
                controls += 1;
            }

            if (controls < 5) {
                alert("Fix all errors before submitting");
                return false;
            }
           
            alert("Thank you", "You're done"); 
            window.close();
        }
        function chkLabel() {
            var lblReferral = document.getElementById("<%=lblReferral.ClientID%>");

            if (lblReferral.value != "") {
                lblReferral.innerHTML = "";
            }
            return false;
        }
        function chkText(x) {
            var lblFirst = document.getElementById("<%=lblFirst.ClientID%>");
            var lblLast = document.getElementById("<%=lblLast.ClientID%>");
            var lblPhone = document.getElementById("<%=lblPhone.ClientID%>");
            var lblEmail = document.getElementById("<%=lblEmail.ClientID%>");

            if (x == 1) {
                if (lblFirst.value = "*First Name") {
                    lblFirst.innerHTML = "First Name";
                    lblFirst.style.color = "Black";
                }
            }
            else if (x == 2) {
                if (lblLast.value = "*Last Name") {
                    lblLast.innerHTML = "Last Name";
                    lblLast.style.color = "Black";
                }
            }
            else if (x == 3) {
                if (lblPhone.value = "*Phone Number") {
                    lblPhone.innerHTML = "Phone Number";
                    lblPhone.style.color = "Black";
                }
            }
            else if (x == 4) {
                if (lblEmail.value = "*Email") {
                    lblEmail.innerHTML = "Email";
                    lblEmail.style.color = "Black";
                }
            } 

            return false;
        }
        function a(event) {
            var char = event.which;
            if (char > 31 && char != 32 && (char < 65 || char > 90) && (char < 97 || char > 122)) {
                return false;
            }
        }
    </script>
    <script src="Scripts/sweetalert.min.js"></script>
    <div id="wrapper" style="height: 710px;">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <h1>Fill out all information:</h1>
                <br />
                <div>
                    <div style="width:600px; margin-left:auto; margin-right:auto; resize:both;">
                        <asp:Label ID="lblFirst" CssClass="inputLabel" runat="server" Text="First Name"></asp:Label><br />
                        <asp:TextBox ID="txtFirst" CssClass="gezza-field" runat="server" 
                            OnClick="return chkText(1)" AutoCompleteType="Disabled"
                            autocomplete="off" onkeypress="return a(event)"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="lblLast" CssClass="inputLabel" runat="server" Text="Last Name"></asp:Label><br />
                        <asp:TextBox ID="txtLast" CssClass="gezza-field" runat="server" 
                            OnClick="return chkText(2)" AutoCompleteType="Disabled"
                            autocomplete="off" onkeypress="return a(event)"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="lblPhone" CssClass="inputLabel" runat="server" Text="Phone Number"></asp:Label><br />
                        <asp:TextBox ID="txtPhone" CssClass="gezza-field" runat="server" 
                            OnClick="return chkText(3)" autocomplete="off" AutoCompleteType="Disabled"></asp:TextBox><br />
                        <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender1" runat="server" 
                            Mask="(999) 999-9999" MaskType="Number" MessageValidatorTip="True" 
                            TargetControlID="txtPhone" ErrorTooltipEnabled="True" />
                        <ajaxToolkit:MaskedEditValidator ID="MaskedEditValidator1" runat="server" 
                            ControlExtender="MaskedEditExtender1" 
                            ControlToValidate="txtPhone" 
                            Display="Static">
                        </ajaxToolkit:MaskedEditValidator>
                        <br />
                        <asp:Label for="txtEmail" ID="lblEmail" CssClass="inputLabel" runat="server" Text="Email"></asp:Label><br />
                        <asp:TextBox ID="txtEmail" CssClass="gezza-field" runat="server" 
                            OnClick="return chkText(4)" autocomplete="off" AutoCompleteType="Disabled"></asp:TextBox><br />
                        <br />
                        <br />
                        <br />
                        <div class="divReferral" style="text-align:left; resize:both;">
                            <label>Do you know anyone looking to buy or sell in the next year?</label>
                        </div>
                        <br />
                        <div>
                            <asp:Label ID="lblReferral" CssClass="inputLabel" runat="server" Text="" ForeColor="Red"></asp:Label>
                            <br />
                            <asp:RadioButton ID="rdbYes" Text="Yes" GroupName="Referral" OnClick="chkLabel()" runat="server" />
                            <asp:RadioButton ID="rdbNo" Text="No" GroupName="Referral" OnClick="chkLabel()" runat="server" />
                        </div>
                        <br />
                        <asp:Button ID="btnSubmit" runat="server" 
                            OnClick="btnSubmit_Click" OnClientClick="return txtChk()" 
                            Text="Submit" />
                        <asp:Label ID="lblText" runat="server" Text="" Visible="false"></asp:Label>
                    </div>
                </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnSubmit" />
        </Triggers>
    </asp:UpdatePanel>    
    </div>
</asp:Content>

