<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmFAQ.aspx.cs" Inherits="Social_Semantics.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>FAQ</h1>
    <table style="width:99%; padding:0px; margin:2px;">
        <tr>
            <td style="font-weight: bold;">What is Text Sentiment Analysis?</td>
        </tr>
        <tr>
            <td style="padding-bottom:20px;">Sentiment analysis is the procedure by which information is extracted from the opinions, appraisals and
emotions of people in regards to entities, events and their attributes.<br /</td>
        </tr>
        <tr>
            <td style="font-weight: bold;">How do we rate sentiment analysis in this application?</td>
        </tr>
        <tr>
            <td style="padding-bottom:20px;">
                <ul>
                    <li>Very Negative</li>
                    <li>Negative</li>
                    <li>Neutral</li>
                    <li>Positive</li>
                    <li>Very Positive</li>
                </ul>
                <i>N/B: Any slang or incorrect spelling will always be categorized as Neutral.</i>
            </td>
        </tr>
        <tr>
            <td style="font-weight: bold;">What are the pre-requisites of participating in this research?</td>
        </tr>
        <tr>
            <td style="padding-bottom:20px;"><ul><li>You need to have either a Facebook or Twitter account which you'll use to login.</li>
                <li>From your selected social media account, you need to <u>like (Facebook)</u> or <u>follow (Twitter)</u> at least one Page or Twitter user.</li></ul></td>
        </tr>
        <tr>
            <td style="font-weight: bold;">How can I start participating in this research?</td>
        </tr>
        <tr>
            <td style="padding-bottom:20px;">Click on the following link <a href="SEMA.aspx">SEMA</a>  and follow the instructions documented there.</td>
        </tr>
        <tr>
            <td style="font-weight: bold;">Why can't I see all my Twitter Pages (Following)?</td>
        </tr>
        <tr>
            <td style="padding-bottom:20px;">Currently, the application has a threshold of upto 200 twitter following. It will display the first recent 200 Following and cut out the rest due to performance issues. Out of the 200 please select one busy one and proceed.</td>
        </tr>
    </table>
</asp:Content>
