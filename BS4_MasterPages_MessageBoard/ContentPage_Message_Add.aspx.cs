using System;
using System.Data.SqlClient;
using System.Globalization;
using System.Net;
using System.Web.Configuration;

namespace BS4_MasterPages_MessageBoard
{
    public partial class ContentPage_Message_Add : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                string vClientIP = GetIPAddress();//取得ClientIP
                Label9.Text = vClientIP;

                DateTime nowTime = DateTime.Now;
                TaiwanCalendar twCalendar = new TaiwanCalendar();
                Label7.Text = $"{twCalendar.GetYear(nowTime)}/{twCalendar.GetMonth(nowTime)}/{twCalendar.GetDayOfMonth(nowTime)}";
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(TextBox1.Text) && !String.IsNullOrEmpty(TextBox2.Text) && !String.IsNullOrEmpty(TextBox3.Text)) {

                //存到資料庫
                saveMessageToData();

                //提示訊息 + 導回首頁 (用 Response.Redirect 會直接導頁沒有彈出警告)
                Response.Write("<script>alert('留言將在審核後貼出!');location.href='Message_Index.aspx';</script>");
            }
        }

        private void saveMessageToData()
        {
            //取得ClientIP
            string vClientIP = GetIPAddress();

            //1.連線資料庫
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["MessageBoardConnectionString"].ConnectionString);

            //2.sql語法
            string sql = "INSERT INTO messageBoard (title, nickname, message, ip) VALUES (@title, @nickname, @message, @ip)";

            //3.創建command物件
            SqlCommand command = new SqlCommand(sql, connection);

            //4.參數化
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("ContentPage_Message_Index.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("ContentPage_Message_Index.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }
    }
}