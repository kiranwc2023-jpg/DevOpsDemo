using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Net;
public partial class _Default : System.Web.UI.Page 
{
    string frmaddrs =String.Empty;
    string toAddress = String.Empty;
    string ccAddress = String.Empty;
    string bccAddress = String.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
       
        //Server =VIZKMANTRIDT01\\SQLEXPRESS; Database = COnfigDB
        //Server =scm-01; Database = scmworkbench
        oplbl.Text = "";
        Panel1.Visible = true;
        using (SqlConnection objConnection = new SqlConnection(@"Server =SCM-db-01; Database = scmworkbench; Trusted_Connection = Yes;"))
        {
            string env = DropDownList1.SelectedValue.ToString();
            //string sqlqry = "select * from deployemail where Env like @env";//ironment
            string sqlqry = "select * from deploymentemailnotify where Environment like @env";//
            objConnection.Open();
            SqlCommand cmd = new SqlCommand(sqlqry, objConnection);
            cmd.Parameters.Add(new SqlParameter("@env", env.ToString()));
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                string status = DropDownList2.SelectedValue.ToString();
                //totxt.Text = dr[1].ToString();
                //cctxt.Text = dr[2].ToString();
                //bcctxt.Text = dr[3].ToString();
                //Ftxt.Text = dr[4].ToString();
                //totxt.Text = dr[1].ToString();
                //cctxt.Text = dr[6].ToString();
                //bcctxt.Text = dr[3].ToString();
                //Ftxt.Text = dr[2].ToString();
                tolbl.Text = dr[1].ToString();
                cclbl.Text = dr[6].ToString();
                bcclbl.Text = dr[3].ToString();
                frmlbl.Text = dr[2].ToString();
                if (status.Contains("Starting"))
                {
                    sbjlbl.Text = "Starting Deployment of BrassRing (" + rntxt.Text + ") to " + DropDownList1.SelectedValue.ToString();
                    blbl.Text = "The latest version of BrassRing is being deployed now to " + DropDownList1.SelectedValue.ToString();
                }
                if (status.Contains("Finished"))
                {

                    sbjlbl.Text = "Finished Deployment of BrassRing to " + DropDownList1.SelectedValue.ToString();
                     blbl.Text = "The latest version of BrassRing has been deployed to " + DropDownList1.SelectedValue.ToString(); //+ " is complete."; //+ "</br>" + "</br>" + "Thanks," + "</br>" + "Kiran";
                }
            }
            
            
        }
        Button1.Enabled = false;
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        try
        {
            Button1.Enabled = true;
            
            //string frmaddrs = Ftxt.Text.ToString();
            //string toAddress = totxt.Text.ToString();
            //string ccAddress = cctxt.Text.ToString();
            //string bccAddress = bcctxt.Text.ToString();
            frmaddrs = frmlbl.Text.ToString();
            toAddress = tolbl.Text.ToString();
            //toAddress = "kimantri@in.ibm.com";
            ccAddress = cclbl.Text.ToString();
            bccAddress = bcclbl.Text.ToString();
            MailMessage message = new MailMessage();
            message.From = new MailAddress(frmaddrs);
            if (toAddress.Trim().Length > 0)
            {
                foreach (string addr in toAddress.Split(';'))
                {
                    message.To.Add(new MailAddress(addr));
                }
            }
            // Allow multiple "Cc" addresses to be separated by a semi-colon
            if (ccAddress.Trim().Length > 0)
            {
                foreach (string addr in ccAddress.Split(';'))
                {
                    message.CC.Add(new MailAddress(addr));
                }
            }

            if (bccAddress.Trim().Length > 0)
            {
                foreach (string addr in bccAddress.Split(';'))
                {
                    message.Bcc.Add(new MailAddress(addr));
                }
            }

            // Set the subject and message body text
            message.Subject = sbjlbl.Text;
            message.Body = blbl.Text;

            // Set the SMTP server to be used to send the message
            SmtpClient objSmtpClient = new SmtpClient("127.0.0.1");
            objSmtpClient.Credentials = CredentialCache.DefaultNetworkCredentials;
            objSmtpClient.Send(message);
            oplbl.Text = "Mail Sent Successfully";

        }
        catch (Exception ex)
        {
            oplbl.Text = ex.Message.ToString();
        }
    }



    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Button1.Enabled = true;
        //frmaddrs = "";
        //toAddress = "";
        //ccAddress = "";
        //bccAddress = "";
        Panel1.Visible = false;
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        Button1.Enabled = true;
        //frmaddrs = "";
        //toAddress = "";
        //ccAddress = "";
        //bccAddress = "";
        Panel1.Visible = false;
    }
}
