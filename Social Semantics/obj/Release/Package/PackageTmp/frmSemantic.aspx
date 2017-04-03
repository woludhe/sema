<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmSemantic.aspx.cs" Inherits="Social_Semantics.frmSemantic" EnableSessionState="true" %>

<asp:Content ID="cntHeader" ContentPlaceHolderID="HeaderContent" runat="server">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $(".PostsPanel").each(function () {
                //if ($(this).find("td.Rating").html().contains("comment")) {
                if (($(this).find("td.Rating").html().indexOf('$comment$')) != -1) {
                    $(this).find("img.imgToggle").hide();
                }
            });

            $("#btnRate").click(function () {
                alert("Please follow the following instructions in order to proceed.\n \n 1. SELECT POST to review \n 2. Click on the check boxes displayed next to comments to TICK CORRECT semantic meanings. \n 3. Click RATE AND SUBMIT BUTTON to fill questionnaire.");


                $(".clsPostReply").each(function () {
                    var rowCount = $(this).find("tr").length;
                    if (rowCount > 1) {
                        $(this).find("div.rateItem").show();
                    }
                });
            });
            
            $(".hypFB").click(function (e) {
                e.stopPropagation();
            });

            $(".PostsPanel").click(function () {
                var imgArrows = $(this).find("img.imgToggle");
                $(this).parent().find("div.CommentsPanel").toggle(function () {

                    if ($(this).css('display') == 'none') {
                        imgArrows.attr("src", imgArrows.attr("src").replace("collapse", "expand"));
                    } else {
                        imgArrows.attr("src", imgArrows.attr("src").replace("expand", "collapse"));
                    }
                });
            });
        });
    </script>

     <style type="text/css">.clsPostReply tr:hover {
    	font-weight: bold;
    	font-size:120%;
    	}
    </style>
</asp:Content>
<asp:Content ID="cntMain" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="upnPosts" runat="server">
        <ContentTemplate>
            <div id="divJava" runat="server" style="color: #D8000C; background-color: #FEEFB3; padding: 3px; display: none;">
                <asp:Label ID="lblJava" runat="server" Text="Javascript is Disabled! This site requires Javascript to function properly, please enable Javascript to continue."></asp:Label><br />
                <asp:HyperLink ID="hypJava" runat="server" NavigateUrl="EnableJavascript.html" Target="_blank">How to Enable Java in your browser</asp:HyperLink>
            </div>
            <br />
            <asp:HiddenField ID="hdnPageID" runat="server" />
            <asp:HiddenField ID="hdnPageName" runat="server" />
            <asp:HiddenField ID="hdnPicURL" runat="server" />

            <asp:HiddenField ID="hdnRate" runat="server" Value="0" />
            <!--Twitter Paging-->
            <asp:HiddenField ID="hdnMaxID" runat="server" Value="0" />
            <asp:HiddenField ID="hdnPrevID" runat="server" Value="0" />
            <!--CheckRateCount-->
            <asp:HiddenField ID="hdnRateCount" runat="server" Value="0" />
            <asp:HiddenField ID="hdnRateCountTotal" runat="server" Value="0" />

            <asp:HiddenField ID="hdnPageNo" runat="server" Value="0" />
            <asp:Panel ID="pnlError" runat="server" BorderColor="#CC0000" BorderStyle="Solid" BorderWidth="3px" BackColor="#FFFF66" Width="99%" Font-Bold="True" Font-Size="Small" Visible="False">
                <asp:Label ID="lblError" runat="server" Text="Error" Style="padding: 3px;"></asp:Label>
            </asp:Panel>
            <div style="font-weight: bold; width: 100%;">
                <asp:Button ID="btnRefresh" runat="server" CssClass="btn btn-default" Text="Refresh" Style="float: right; width: 100px;" BorderStyle="Solid" OnClick="btnRefresh_Click" />
            </div>
            <hr />
            <asp:Panel ID="pnlPages" runat="server">
                <asp:Repeater ID="rptPages" runat="server" OnItemCommand="rptPages_ItemCommand" OnItemDataBound="rptPages_ItemDataBound">
                    <HeaderTemplate>
                        <div style="font-weight: bold;">
                            <asp:Label ID="lblPageTitle" runat="server" Text=""></asp:Label>
                        </div>
                        <table style="width: 90%; border-collapse: collapse;">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr style="border-bottom: 1px solid #C0C0C0;">
                            <td><%# Eval("page_id") %></td>
                            <td>
                                <asp:Image ID="imgPage" runat="server" ImageUrl='<%# Eval("pic_small") %>' />
                                &nbsp;<%# Eval("name") %></td>
                            <td>
                                <asp:Button ID="btnSelectPage" runat="server" Text="Select Page" BorderStyle="Solid" CommandName="SELECTPAGE" CommandArgument='<%# Eval("page_id").ToString() + "|" + Eval("name").ToString() + "|" + Eval("pic_small").ToString() %>' /></td>
                        </tr>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <tr style="background-color: #f7f7f7; border-bottom: 1px solid #C0C0C0;">
                            <td><%# Eval("page_id") %></td>
                            <td>
                                <asp:Image ID="imgPage" runat="server" ImageUrl='<%# Eval("pic_small") %>' />&nbsp;<%# Eval("name") %></td>
                            <td>
                                <asp:Button ID="btnSelectPage" runat="server" Text="Select Page" BorderStyle="Solid" CommandName="SELECTPAGE" CommandArgument='<%# Eval("page_id").ToString() + "|" + Eval("name").ToString() + "|" + Eval("pic_small").ToString() %>' /></td>
                        </tr>
                    </AlternatingItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </asp:Panel>
            <asp:Panel ID="pnlPosts" runat="server" Style="display: none;">
                <div style="font-weight: bold; width: 100%;">
                    <asp:Image ID="imgPageLogo" runat="server" ImageUrl="" />&nbsp;
                    <asp:Label ID="lblHeader" runat="server" Text=""></asp:Label>
                    <asp:Button ID="btnBack" runat="server" CssClass="btn btn-primary btn-large" Text="Back" Style="width: 100px; float: right; margin: auto; margin-right: 10px;" BorderStyle="Solid" OnClick="btnBack_Click" />
                    <input id="btnRate" class="btn btn-primary btn-large" type="button" value="Rate" style="width: 150px; font-weight: bold; float: right; margin: auto; margin-right: 10px;" />
                </div>
                <hr />
                <asp:Repeater ID="rptPosts" runat="server" OnItemCommand="rptPosts_ItemCommand" OnItemDataBound="rptPosts_ItemDataBound">
                    <HeaderTemplate>
                        <table style="width: 90%; border-collapse: collapse;">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr id="trPost" runat="server">
                            <td style="padding: 0px;">
                                <%--<a href='?PostID=<%# ((System.Data.DataRowView)
                                           Container.DataItem)["post_id"]%>'>
                                    View Result
                                </a>--%>
                                <asp:Panel ID="pnlPosts" runat="server" class="PostsPanel">
                                    <table style="width: 100%; border-collapse: collapse; font-family: Calibri; font-size: 14px; margin: 1px; font-weight: normal; background-color: #99CCFF; border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #CC99FF;">
                                        <tr style="padding: 0px; border-bottom: 1px solid #C0C0C0;">
                                            <td style="width: 5%; border-right: 1px solid silver;"><%# Eval("no") %></td>
                                            <td style="width: 75%;"><%# Eval("message") %><br />
                                                &nbsp;<b>❤</b><span style="font-family: calibri; font-size: 11px;">&nbsp;<%# Eval("likes") %></span>&nbsp;<b>⟳</b><span style="font-family: calibri; font-size: 11px;">&nbsp;<%# Eval("shares") %></span>&nbsp;
                                                <span style="font-family: calibri; font-size: 11px; color: #808080; font-style: italic"><%# Eval("created_time") %></span>
                                            </td>
                                            <td style="width: 10%;">
                                                <asp:HyperLink ID="hypPost" CssClass="hypFB" runat="server" NavigateUrl='<%# Eval("link") %>' ImageUrl='<%# Eval("type") %>' ToolTip="Click to view full post" Target="_blank">HyperLink</asp:HyperLink>
                                            </td>
                                            <td style="width: 10%;" class="Rating"><%# Eval("response_result") %>&nbsp;
                                                <div id="jRate" runat="server" style="color: #000066"><%# Eval("response_rating") %></div>
                                                <div style="float: right;">
                                                    <img alt="" src="/images/collapse_blue.jpg" class="imgToggle" />
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                                <asp:Panel ID="pnlPostsReplies" runat="server" class="CommentsPanel">
                                    <table style="width: 100%; border-collapse: collapse; font-family: Calibri; font-size: 12px;">
                                        <tr style="padding: 0px;">
                                            <td style="width: 5%;"></td>
                                            <td colspan="3">
                                                <asp:Repeater ID="rptPostsReply" runat="server" OnItemDataBound="rptPostsReply_ItemDataBound">
                                                    <HeaderTemplate>
                                                        <table style="width: 100%; border-collapse: collapse;" class="clsPostReply">
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr style="font-family: Calibri; font-size: 14px; border-bottom: 1px solid #C0C0C0; padding: 0px;">
                                                            <td style="background-color: #FFFFFF; width: 70%;"><%# Eval("text") %>
                                                            </td>
                                                            <td style="background-color: #FFFFFF; width: 20%;"><%# Eval("result") %>
                                                            </td>
                                                            <td style="width: 10%;">
                                                                <asp:Panel ID="pnlchkRate" runat="server" Style="display: none; text-align: center; width: 99%;" class="rateItem">
                                                                    <asp:CheckBox ID="chkRate" runat="server" />
                                                                    <label for="chkRate"><span></span></label>
                                                                </asp:Panel>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                    <AlternatingItemTemplate>
                                                        <tr style="font-family: Calibri; font-size: 14px; border-bottom: 1px solid #C0C0C0; padding: 0px;">
                                                            <td style="background-color: #CCCCCC; width: 70%;"><%# Eval("text") %>
                                                            </td>
                                                            <td style="background-color: #CCCCCC; width: 20%;"><%# Eval("result") %>
                                                            </td>
                                                            <td style="background-color: #CCCCCC; width: 10%;">
                                                                <asp:Panel ID="pnlchkRate" runat="server" Style="display: none; text-align: center; width: 99%;" class="rateItem">
                                                                    <asp:CheckBox ID="chkRate" runat="server" /><%--BackColor="#CCCCCC"--%>
                                                                    <label for="chkRate"><span></span></label>
                                                                </asp:Panel>
                                                            </td>
                                                        </tr>
                                                    </AlternatingItemTemplate>
                                                    <FooterTemplate>
                                                        <tr>
                                                            <td colspan="3">
                                                                <asp:Panel ID="pnlchkRate" runat="server" Style="display: none;" class="rateItem">
                                                                    <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary btn-large" Text="Rate & Submit" Style="float: right; margin: auto;" BorderStyle="Solid" OnClick="btnSubmit_Click" />
                                                                </asp:Panel>
                                                            </td>
                                                        </tr>
                                                        </table>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
                <br />
                <asp:Button ID="btnPrevious" runat="server" Text="Previous <<" Style="width: 100px;" CssClass="btn btn-default" OnClick="btnPrevious_Click" Enabled="false" />
                &nbsp;
                <asp:Button ID="btnNext" runat="server" Text="Next >>" Style="width: 100px;" CssClass="btn btn-default" OnClick="btnNext_Click" />
                &nbsp;
                <span style="float:right;"><asp:HyperLink ID="hypHelp" runat="server" NavigateUrl="~/SEMA.aspx" Target="_blank">Help</asp:HyperLink></span>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

