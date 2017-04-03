<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JSDetect.aspx.cs" Inherits="Social_Semantics.JSDetect" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <meta id="refreshCommand" runat="server"  http-equiv="REFRESH" content="2; url=Default.aspx" /> 
</head>
<body>
    <form id="detectForm" runat="server">    
    <div>
    </div>
    <script type="text/javascript" language="javascript">
        setTimeout("RunJsOn()", 1000);
        function RunJsOn() {
            //document.detectForm.submit();
            detectForm.submit();
        }
    </script>
    </form>
    
</body>
</html>
