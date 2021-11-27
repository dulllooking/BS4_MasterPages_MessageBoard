using System;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace BS4_MasterPages_MessageBoard
{
    public partial class ContentPageV_Manager_Verify : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //權限關門判斷
            if (Session["Power"] == null || Session["Login"] == null || Session["Power"].ToString().Equals("False")) {
                Response.Redirect("Manager_SignIn.aspx"); //導回登入頁
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            //1.連線資料庫
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["MessageBoardConnectionString"].ConnectionString);

            //2.sql語法
            string sql = "INSERT INTO managerData (account, password, email) VALUES (@account, @password, @email)";

            //3.創建command物件
            SqlCommand command = new SqlCommand(sql, connection);

            //4.參數化
            command.Parameters.AddWithValue("@account", TextBox1.Text);
            command.Parameters.AddWithValue("@password", TextBox2.Text);
            command.Parameters.AddWithValue("@email", TextBox3.Text);

            //5.資料庫連線開啟
            connection.Open();

            //6.執行sql (新增刪除修改)
            command.ExecuteNonQuery(); //無回傳值

            //7.資料庫關閉
            connection.Close();

            //刷新頁面
            Response.Redirect("Manager_Verify.aspx");
        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Message_Verify.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("Message_Index.aspx");
        }
    }
}