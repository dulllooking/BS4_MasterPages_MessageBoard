using System;
using System.Data.SqlClient;
using System.Web.Configuration;


namespace BS4_MasterPages_MessageBoard
{
    public partial class ContentPage_Message_Main : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //直接開啟該頁網址時無id導回首頁
            if (Request.QueryString["id"] == null) {
                Response.Redirect("ContentPage_Message_Index.aspx"); //導回首頁
            }

            if (!IsPostBack) {
                showLinkTitle();
                loadReply();
            }
        }

        private void loadReply()
        {
            //取得網址傳值的值id
            string getID = Request.QueryString["id"];

            //1.連線資料庫
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["MessageBoardConnectionString"].ConnectionString);

            //2.sql語法
            string sql = "SELECT title_id, title, nickname, message, initDate FROM replyMessage WHERE (title_id = " + getID + ") AND verify = 1";

            //3.創建command物件
            SqlCommand command = new SqlCommand(sql, connection);

            //4.資料庫連線開啟
            connection.Open();

            //5.執行sql
            SqlDataReader reader = command.ExecuteReader(); //指標指在BOF(表格之上)

            //讀出一筆資料寫入控制器 (.Read()一次會跑一筆)
            //.Read()=>指針往下一移並回傳bool，如果要讀全部可用while //最後一筆之後是EOF
            Repeater1.DataSource = reader;//repeater的資料來源是從rereader來
            Repeater1.DataBind();//執行繫結

            //6.資料庫關閉
            connection.Close();
        }

        private void showLinkTitle()
        {
            string getID = Request.QueryString["id"];

            //1.連線資料庫
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["MessageBoardConnectionString"].ConnectionString);

            //2.sql語法
            string sql = "SELECT id, title, nickname, message, initDate FROM messageBoard WHERE (id = " + getID + ")";

            //3.創建command物件
            SqlCommand command = new SqlCommand(sql, connection);

            //4.資料庫連線開啟
            connection.Open();

            //5.執行sql
            SqlDataReader reader = command.ExecuteReader(); //指標指在BOF(表格之上)

            //讀出一筆資料寫入控制器 (.Read()一次會跑一筆)
            //.Read()=>指針往下一移並回傳bool，如果要讀全部可用while //最後一筆之後是EOF
            if (reader.Read()) {
                Label2.Text = reader["title"].ToString();
                Label4.Text = reader["nickname"].ToString();
                Label7.Text = reader["initDate"].ToString();
                Label8.Text = reader["message"].ToString();
            }

            //6.資料庫關閉
            connection.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("ContentPage_Message_Reply.aspx?id=" + Request.QueryString["id"]);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("ContentPage_Message_Index.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("ContentPage_Message_Index.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {

        }
    }
}