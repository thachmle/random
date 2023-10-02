<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/ResponsiveContentEmpty.Master"
    CodeBehind="Cart.aspx.cs" Inherits="OSH_PCOS_ADMIN_Web.Cart" %>

<%@ Register Src="~/UserControls/ucOrderDetails.ascx" TagName="OrderDetails" TagPrefix="osh" %>
<%@ Register Src="UserControls/ucPublicationsRecentlyOrdered.ascx" TagName="PubsTop10EA" TagPrefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentArea2" runat="server">
    <osh:OrderDetails ID="ucOrderDetails" controlMode="viewcart" runat="server"></osh:OrderDetails>
    <br />
    <uc1:PubsTop10EA ID="PubsTop10EA" runat="server" />

    <div class="modalHolder">
        <div class="row successLightbox"></div>
    </div>
    <asp:HiddenField ID="hidCartEmail" Value="" runat="server" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="CustomJavaScript" runat="server">
    <script type="text/javascript">
        function ScrollToDiv(DivName, AnimateTime) {
            $("html, body").animate({ scrollTop: (DivName == '') ? 0 : $('#' + DivName).position().top }, AnimateTime);
        }

        function initializePage() {
            //initializePartnerEmailLightbox();
            addCartButtonClickEventsEmail();
        }

        if ($('#hidCartEmail').val() == "") {
            setTimeout(function () { addCartButtonClickEventsEmail(); }, 300);
        }

        function Redirecthomepage() {

            window.location.replace("SearchResults.aspx");
        }

        function CloseModal() {
            $('#successModal').modal('hide');
            return true;
        }

        //disable closing modal when clicking on backdrop
        $("#successModal").modal({
            backdrop: 'static',
            keyboard: false
        });




    </script>

    <div class="modal fade background-and-border-none" id="successModal" tabindex="-1" role="dialog" aria-hidden="true" data-keyboard="false" data-backdrop="static">
        <div class="modal-dialog modal-full" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel">* Please enter your email address:</h4>
                </div>
                <div class="modal-body">
                    <%--  <input type="text" name="txtEmail" title="" id="txtEmail"  maxlength="40"  class="form-control" >
                <input type="email" pattern="[^ @]*@[^ @]*" title="" id="txtEmail"  maxlength="40"  class="form-control" >--%>
                    <label aria-label="req" for="txtEmail" style="float: right;">* Required field</label><br />
                    <input type="text" name="txtEmail" id="txtEmail" placeholder="EMAIL ADDRESS" /><br />
                    <span id="divMsg"></span>
                    <%-- <asp:TextBox ID="txtEmail" runat="server"  MaxLength="100" Width="190px" style="margin-bottom:0px;"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvConfEmail" CssClass="span6" style="color:#8F0000" Display="Dynamic"   runat="server" ControlToValidate="txtEmail" ControlFriendlyName="Confirm Email" Text="* Confirm Email required" ></asp:RequiredFieldValidator>
               <asp:RegularExpressionValidator ID="regexConfEmail" CssClass="span6" style="color:#8F0000" Display="Dynamic"   runat="server" ControlToValidate="txtEmail"  ValidationExpression="\b[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}\b" ErrorMessage="Confirm Email must be in a valid email format" Text="* Not a valid email format" />
                    --%>
                </div>
                <div class="modal-footer">
                    <div class="m-auto">
                        <%--<input  type="button" id="btnEmail" class="btn btn-primary lightboxCartButton" onclick="CheckIsPartner(); return false;" value="Submit">--%>
                        <%-- v3.1.2 added cancel button, will redirect to SerachResults page --%>
                        <button type="submit" id="btnCancelEmail" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="Cancel" onclick="Redirecthomepage();return false;">Cancel</button>
                        <button type="submit" id="btnEmail" class="btn btn-primary lightboxCartButton disabled" data-toggle="tooltip" data-placement="bottom" title="Submit" onclick="CheckIsPartner(); return false;">Submit &raquo;</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
   
</asp:Content>


