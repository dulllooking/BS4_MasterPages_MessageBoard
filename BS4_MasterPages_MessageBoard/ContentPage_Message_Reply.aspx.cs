using System;
using System.Data.SqlClient;
using System.Globalization;
using System.Net;
using System.Web.Configuration;

namespace BS4_MasterPages_MessageBoard
{
    public partial class ContentPage_Message_Reply : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //直接開啟該頁網址時無id導回首頁
            if (Request.QueryString["id"] == null) {
                Response.Redirect("ContentPage_Message_Index.aspx"); //導回首頁
            }

            if (!IsPostBack) {
                string vClientIP = GetIPAddress();//取得ClientIP
                Label9.Text = vClientIP;

                DateTime nowTime = DateTime.Now;
                TaiwanCalendar twCalendar = new TaiwanCalendar();
                Label7.Text = $"{twCalendar.GetYear(nowTime)}/{twCalendar.GetMonth(nowTime)}/{twCalendar.GetDayOfMonth(nowTime)}";

                loadTitle();
            }
        }
        private void loadTitle()
        {
            string title_id = Request.QueryString["id"];
            //string title_id = Request["id"]; 

            //1.連線資料庫
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["MessageBoardConnectionString"].ConnectionString);

            //2.sql語法
            string sql = "SELECT title FROM messageBoard WHERE (id = " + title_id + ")"; ;

            //3.創建command物件
            SqlCommand command = new SqlCommand(sql, connection);

            //4.資料庫連線開啟
            connection.Open();

            //5.執行sql
            SqlDataReader reader = command.ExecuteReader();
            //讀出一筆資料寫入控制器 (.Read()一次會跑一筆)
            //.Read()=>指針往下一移並回傳bool，如果要讀全部可用while //最後一筆之後是EOF
            if (reader.Read()) {
                TextBox1.Text = "RE : " + reader["title"].ToString();
            }

            //6.資料庫關閉
            connection.Close();
        }

        //Get Ip Address
        protected string GetIPAddress()
        {
            //取得本機名稱
            string hostname = Dns.GetHostName();
            //取得本機的IpHostEntry類別實體
            IPHostEntry ipHostEntry = Dns.GetHostEntry(hostname);
            //取得
            string ipAddress = "";
            foreach (IPAddress ipaddress in ipHostEntry.AddressList) {
                // 只取得IP V4的Address
                if (ipaddress.AddressFamily == System.Net.Sockets.AddressFamily.InterNetwork) {
                    ipAddress = ipaddress.ToString();
                }
            }
            return ipAddress;
        }
        private void saveReplyToData()
        {
            //取得ClientIP
            string vClientIP = GetIPAddress();

            //1.連線資料庫
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["MessageBoardConnectionString"].ConnectionString);

            //2.sql語法
            string sql = "INSERT INTO replyMessage (title_id, title, nickname, message, ip) VALUES (@title_id, @title, @nickname, @message, @ip)";

            //3.創建command物件
            SqlCommand command = new SqlCommand(sql, connection);

            //4.參數化
            command.Parameters.AddWithValue("@title_id", Convert.ToInt32(Request.QueryString["id"]));
            command.Parameters.AddWithValue("@title", TextBox1.Text);
            command.Parameters.AddWithValue("@nickname", TextBox2.Text);
            command.Parameters.AddWithValue("@message", TextBox3.Text);
            command.Parameters.AddWithValue("@ip", vClientIP);

            //5.資料庫連線開啟
            connection.Open();

            //6.執行sql (新增刪除修改)
            command.ExecuteNonQuery(); //無回傳值

            //7.資料庫關閉
            connection.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string title_id = Request.QueryString["id"];
            Response.Redirect($"ContentPage_Message_Main.aspx?id={title_id}");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("ContentPage_Message_Index.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(TextBox1.Text) && !String.IsNullOrEmpty(TextBox2.Text) && !String.IsNullOrEmpty(TextBox3.Text)) {

                //存到資料庫
                saveReplyToData();

                //提示訊息 + 導回首頁 (用 Response.Redirect 會直接導頁沒有彈出警告)
                Response.Write("<script>alert('留言將在審核後貼出!');location.href='Message_Index.aspx';</script>");
            }
        }
    }
}