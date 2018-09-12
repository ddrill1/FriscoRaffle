<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Default.aspx.cs" Inherits="FriscoRaffle.Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Src="~/Controls/UserEntry.ascx" TagPrefix="uc1" TagName="UserEntry" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        function txtChk() {
            var controls = 0;

            /* ----------------------------------------------- 
               DECLARING OBJECTS TO HOLD ALL CONTROLS
             ----------------------------------------------- */

            const labels = document.getElementsByClassName('inputLabel');
            const texts = document.getElementsByClassName('gezza-field');
            var rdbYes = document.getElementById("<%=rdbYes.ClientID%>");
            var rdbNo = document.getElementById("<%=rdbNo.ClientID%>");
            var rdbYesLead = document.getElementById("<%=rdbYesLead.ClientID%>");
            var rdbNoLead = document.getElementById("<%=rdbNoLead.ClientID%>");
            const radiosRef = document.getElementsByClassName('referral');
            const radiosLead = document.getElementsByClassName('lead');
                                                                                                      
            /*--------------------------------------------------------
                RUNNING FOR LOOPS THROUGH DECLARED OBJECTS TO 
                HANDLE ANY ERRORS (TERNARY OPERATORS INSIDE FORS)
                (SECOND EDIT)
              ------------------------------------------------------- */
            for (var i = 0; i < 4; i++) {
                labels[i].style.color = (texts[i].value == "" ? "FireBrick" : "Black");
                labels[i].innerHTML = (texts[i].value == "" && labels[i].innerHTML.charAt(0) != "*" ? "*" + labels[i].innerHTML : labels[i].innerHTML);
            }

            labels[4].innerHTML = (rdbYesLead.checked == false && rdbNoLead.checked == false ? "*Please select one" : "");
            controls = (rdbYesLead.checked == false && rdbNoLead.checked == false ? controls : controls + 1);
                   
            labels[5].innerHTML = (rdbYes.checked == false && rdbNo.checked == false ? "*Please select one" : "");
            controls = (rdbYes.checked == false && rdbNo.checked == false ? controls : controls + 1);
      

            for (var l = 0; l < 4; l++) {
                if (texts[l].value != "") {
                    controls += 1;
                }
            }

            if (controls < 6) {
                alert("Fix all errors before submitting");
                return false;
            }
           
            alert("Thank you", "You're done"); 
            window.close();
        }
        function chkLabel(x) {
            if (x == 1) {
                var lblReferral = document.getElementById("<%=lblReferral.ClientID%>");
                if (lblReferral.value != "") {
                    lblReferral.innerHTML = "";
                }
            }
            else {
                var lblLead = document.getElementById("<%=lblLead.ClientID%>");
                if (lblLead.value != "") {
                    lblLead.innerHTML = "";
                }
            }
            return false;
        }
        function chkText(x) {
            var lblFirst = document.getElementById("<%=lblFirst.ClientID%>");
            var lblLast = document.getElementById("<%=lblLast.ClientID%>");
            var lblPhone = document.getElementById("<%=lblPhone.ClientID%>");
            var lblEmail = document.getElementById("<%=lblEmail.ClientID%>");
            var txtPhone = document.getElementById("<%=txtPhone.ClientID%>");

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

                if (txtPhone.value == "(___) ___-____") {
                    txtPhone.setSelectionRange(1, 1);
                    txtPhone.autofocus = true;
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
            if (char != 45) {
                if (char > 31 && char != 32 && (char < 65 || char > 90) && (char < 97 || char > 122)) {
                return false;
                }
            }
        }
    </script>
    <script src="Scripts/sweetalert.min.js"></script>
    <div id="wrapper" style="height: 859px;">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <h1>Fill out all information:</h1>
                <br />
                <div>
                    <div style="width:600px; margin-left:auto; margin-right:auto; resize:both;">
                        <asp:Label ID="lblFirst" CssClass="inputLabel" runat="server" Text="First Name" ForeColor="Black"></asp:Label><br />
                        <asp:TextBox ID="txtFirst" CssClass="gezza-field" runat="server" 
                            OnClick="return chkText(1)" AutoCompleteType="Disabled"
                            autocomplete="off" onkeypress="return a(event)" onfocus="return chkText(1)">
                        </asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="lblLast" CssClass="inputLabel" runat="server" Text="Last Name" ForeColor="Black"></asp:Label><br />
                        <asp:TextBox ID="txtLast" CssClass="gezza-field" runat="server" 
                            OnClick="return chkText(2)" AutoCompleteType="Disabled"
                            autocomplete="off" onkeypress="return a(event)" onfocus="return chkText(2)"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="lblPhone" CssClass="inputLabel" runat="server" Text="Phone Number" ForeColor="Black"></asp:Label><br />
                        <asp:TextBox ID="txtPhone" CssClass="gezza-field" runat="server" 
                            OnClick="return chkText(3)" autocomplete="off" 
                            AutoCompleteType="Disabled" onselect="return chkText(3)"></asp:TextBox><br />
                        <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender1" runat="server" 
                            Mask="(999) 999-9999" MaskType="Number" MessageValidatorTip="True" 
                            TargetControlID="txtPhone" ErrorTooltipEnabled="True" />
                        <ajaxToolkit:MaskedEditValidator ID="MaskedEditValidator1" runat="server" 
                            ControlExtender="MaskedEditExtender1" 
                            ControlToValidate="txtPhone" 
                            Display="Static">
                        </ajaxToolkit:MaskedEditValidator>
                        <br />
                        <asp:Label for="txtEmail" ID="lblEmail" CssClass="inputLabel" runat="server" Text="Email" ForeColor="Black"></asp:Label><br />
                        <asp:TextBox ID="txtEmail" CssClass="gezza-field" runat="server" 
                            OnClick="return chkText(4)" autocomplete="off" 
                            AutoCompleteType="Disabled" onfocus="return chkText(4)"></asp:TextBox><br />
                        <br />
                        <br />
                        <br />
                        <div class="divReferral" style="text-align:left; resize:both;">
                            <label>Are you looking to buy or sell in the next year?</label>
                        </div>
                        <br />
                        <div>
                            <asp:Label ID="lblLead" CssClass="inputLabel" runat="server" Text="" ForeColor="FireBrick"></asp:Label>
                            <br />
                            <asp:RadioButton ID="rdbYesLead" Text="Yes" class="lead" GroupName="Lead" OnClick="chkLabel(0)" runat="server" ForeColor="Black" />
                            <asp:RadioButton ID="rdbNoLead" Text="No" class="lead" GroupName="Lead" OnClick="chkLabel(0)" runat="server" ForeColor="Black" />
                        </div>
                        <br />
                        <br />
                        <div class="divReferral" style="text-align:left; resize:both;">
                            <label>Do you know anyone looking to buy or sell in the next year?</label>
                        </div>
                        <br />
                        <div>
                            <asp:Label ID="lblReferral" CssClass="inputLabel" runat="server" Text="" ForeColor="FireBrick"></asp:Label>
                            <br />
                            <asp:RadioButton ID="rdbYes" Text="Yes" class="referral" GroupName="Referral" OnClick="chkLabel(1)" runat="server" ForeColor="Black" />
                            <asp:RadioButton ID="rdbNo" Text="No" class="referral" GroupName="Referral" OnClick="chkLabel(1)" runat="server" ForeColor="Black" />
                        </div>
                        <br />
                        <asp:Button ID="btnSubmit" runat="server" 
                            style="border-radius:5px; background-color:forestgreen; width:85px; height:45px;"
                            OnClick="btnSubmit_Click" OnClientClick="return txtChk()" 
                            Text="Submit" Font-Size="Medium" ForeColor="White" />
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

