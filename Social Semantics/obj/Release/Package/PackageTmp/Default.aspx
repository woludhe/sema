<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Social_Semantics._Default" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%--<div ID="divJava" runat="server" style="color: #D8000C; background-color: #FEEFB3; padding: 3px; display:none;">
        <asp:Label ID="lblJava" runat="server" Text="Javascript is Disabled! This site requires Javascript to function properly, please enable Javascript to continue."></asp:Label><br />
        <asp:HyperLink ID="hypJava" runat="server" NavigateUrl="EnableJavascript.html" Target="_blank">How to Enable Java in your browser</asp:HyperLink>
    </div>--%>
    <div class="jumbotron">
        <table>
            <tr>
                <td style="background-image: url('images/CHP_Semantics1.jpg'); background-repeat: no-repeat; width:30%;"></td>
                <td style="width:70%; padding-left:20px;">
                    <h1>Social Media Semantics</h1>
                    <p class="lead">Capture sentiments from social networking posts through clustering and lexical analysis.</p>
                    <p><a href="SEMA.aspx" class="btn btn-primary btn-large">Learn more &raquo;</a></p>
                </td>
            </tr>
        </table>
    </div>
    <div class="row">
        <div class="col-md-4" style="width:50%;">
            <h2>Get started!</h2>
            <p>
                Social Media Semanic Analysis. <br />
                Click button to analyze social media post responses to selected social media sites.
            </p>
            <p>
                <a class="btn btn-default" href="frmSemantic.aspx">Start Analysis &raquo;</a>
            </p>
        </div>
        <div class="col-md-4" style="width:50%;">
            <h2>FAQ</h2>
            <p>
                Find help and meanings to terminologies related to the application.
            </p>
            <p>
                <a class="btn btn-default" href="frmFAQ.aspx">Learn more &raquo;</a>
            </p>
        </div>
    </div>
    <table>
        <tr>
            <td>
                <div
                  class="fb-like"
                  data-share="true"
                  data-width="450"
                  data-show-faces="true">
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
