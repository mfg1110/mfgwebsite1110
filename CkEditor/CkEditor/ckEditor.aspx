<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ckEditor.aspx.cs" Inherits="CkEditor.ckEditor" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ckEditor</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <CKEditor:CKEditorControl ID="CKEditor1" BasePath="/ckeditor/" runat="server"></CKEditor:CKEditorControl>
    </div>
    <div>
        <asp:Button ID="Button1" runat="server" Text="Button" onclick="Button1_Click" />
    </div>
    <div>
        <asp:label runat="server" ID="lblText"></asp:label>
    </div>
    <div>
        <asp:label runat="server" ID="lbl2"></asp:label>
    </div>
    </form>
</body>

</html>
