using System;

namespace CkEditor
{
    public partial class ckEditor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string str = CKEditor1.Text;
            string str1 = Server.HtmlDecode(str);
            string str2 = Server.HtmlEncode(str);
            lblText.Text = "Text After HtmlDecode : " + str1;
            lbl2.Text = "Text After HtmlEncode : " + str2;
        }

    }
}