<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SEMA.aspx.cs" Inherits="Social_Semantics.SEMA" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>SEMA</h2>
    <p><b>SEMA</b> is derived from a swahili word which means asking someone to talk while you are listening. 
    In this context, we are going to attempt using identified researched semantic analysis alorithms to derive 
        meanings of short text messages posted in response to social media posts. 
        <br />
        <br />
        These comments will be analyzed and categorized 
        into 5 categories i.e. Very Negative, Negative, Neutral, Positive and Very Positive. 
        <br /><i>N/B: Any slang or incorrect spelling will always be categorized as Neutral.</i>
        <br />
        <div class="jumbotron" style="font-size: medium;">
        <div><iframe width="560" height="315" src="https://www.youtube.com/embed/z_fL_XiLETA" frameborder="0" allowfullscreen></iframe></div>
        <h3 style="margin-top:-1px;">What to do</h3>
        To begin this exercise, 
        <ol>
        <li>Go to the Home Page (Link above) and on the Get Started section, click the <b>Start Analysis</b> button.<br />
            <div style="padding:2px;"><asp:Image ID="Image1" runat="server" ImageUrl="~/images/screen/Image1.gif" Height="300px" /></div><br />
            </li>

            <li>A list of all the pages you like on Social Media account you've used logging in will be displayed.<br />
                <div style="padding:2px;"><asp:Image ID="Image2" runat="server" ImageUrl="~/images/screen/Image 2.gif" Height="300px" /></div><br />
            </li>
            <li>Click on the <b>Select Page</b> button of the corresponding page on the list to proceed.</li>
            <li>A list of the posts (in blue), starting with the latest 5 will be displayed with their corresponding semantic rating analysis along it&#39;s comments (shown in white and grey). <br /><i>N/B: Posts withouts comments cannot be used in this exercise, you can select Back button to select a busy page (with comments).</i> <br />
                <div style="padding:2px;"><asp:Image ID="Image3" runat="server" ImageUrl="~/images/screen/Image 3.gif" Height="300px" /></div><br />
            </li>
            <li>After checking them out, click on the <b>Rate</b> button on top of the page to rate each comment of the selected post. i.e. Check the checkbox of the corresponding post if analysis is correct.<br />
                <div style="padding:2px;"><asp:Image ID="Image4" runat="server" ImageUrl="~/images/screen/Image 4.gif" Height="300px" /></div><br />
            </li>
            <li>Click <b>Rate & Submit</b> button to Fill Questionnaire.<br /><div style="padding:2px;"><asp:Image ID="Image5" runat="server" ImageUrl="~/images/screen/Image 5.gif" Height="300px" /></div>
            </li>
            <li>Submit Questionnaire after completion.<br />
                <div style="padding:2px;"><asp:Image ID="Image6" runat="server" ImageUrl="~/images/screen/Image 6.gif" Height="300px" /></div><br />
            </li>
        </ol></div>
        Participating in this exercise will help us establish how well semantic text analysis can be used to rate user comments and improve 
        social media user engagement analysis techniques.
    </p>
</asp:Content>
