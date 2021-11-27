using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI.WebControls;

namespace BS4_MasterPages_MessageBoard
{
    public partial class Manager_Message : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //審核權限
            if (Session["Power"] == null || Session["Login"] == null) {
                Response.Redirect("Manager_SignIn.aspx"); //導回登入頁
            }

            if (!IsPostBack) {
                showMessageBoard();
                showReplyMessage();
            }
        }

        private void showMessageBoard()
        {
            //1.連線資料庫
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["MessageBoardConnectionString"].ConnectionString);

            //2.sql語法
            string sql = "SELECT * FROM messageBoard ORDER BY initDate DESC";

            //3.創建command物件
            SqlCommand command = new SqlCommand(sql, connection);

            //4.創建適配器 (適配器會自己開關)
            SqlDataAdapter adapter = new SqlDataAdapter(command);

            //5.創建一個DataSet的記憶體資料庫
            DataTable table = new DataTable();

            //6.將資料存入DataSet內
            adapter.Fill(table);
            //拿資料秀到畫面上
            //控制器資料來源
            GridView1.DataSource = table;
            //控制器綁定
            GridView1.DataBind();
        }
        private void showReplyMessage()
        {
            //1.連線資料庫
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["MessageBoardConnectionString"].ConnectionString);

            //2.sql語法
            string sql = "SELECT * FROM replyMessage ORDER BY initDate DESC";

            //3.創建command物件
            SqlCommand command = new SqlCommand(sql, connection);

            //4.創建適配器 (適配器會自己開關)
            SqlDataAdapter adapter = new SqlDataAdapter(command);

            //5.創建一個DataSet的記憶體資料庫
            DataTable table = new DataTable();

            //6.將資料存入DataSet內
            adapter.Fill(table);
            //拿資料秀到畫面上
            //控制器資料來源
            GridView2.DataSource = table;
            //控制器綁定
            GridView2.DataBind();
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //取得點擊這列的id
            string id = GridView1.DataKeys[e.RowIndex].Value.ToString();

            //1.連線資料庫
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["MessageBoardConnectionString"].ConnectionString);

            //2.宣告sql語法
            string sql = "DELETE FROM messageBoard WHERE id = " + id;
            string sql2 = "DELETE FROM replyMessage WHERE title_id = " + id;

            //3.創建command物件
            SqlCommand command = new SqlCommand(sql, connection);
            SqlCommand command2 = new SqlCommand(sql2, connection);

            //4.資料庫連線開啟
            connection.Open();

            //5.執行sql
            command2.ExecuteNonQuery();
            command.ExecuteNonQuery();

            //6.資料庫關閉
            connection.Close();

            //刷新頁面
            //Response.Redirect(Request.Url.ToString());
            Response.Redirect("Message_Verify.aspx");
        }
        protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //取得點擊這列的id
            string id = GridView2.DataKeys[e.RowIndex].Value.ToString();

            //1.連線資料庫
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["MessageBoardConnectionString"].ConnectionString);

            //2.宣告sql語法
            string sql = "DELETE FROM replyMessage WHERE id = " + id;

            //3.創建command物件
            SqlCommand command = new SqlCommand(sql, connection);

            //4.資料庫連線開啟
            connection.Open();

            //5.執行sql
            command.ExecuteNonQuery();

            //6.資料庫關閉
            connection.Close();

            //刷新頁面
            Response.Redirect(Request.Url.ToString());
            //Response.Redirect("Message_Verify.aspx");
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            string dataMessageId = "";

            for (int i = 0; i < GridView1.Rows.Count; i++) {
                CheckBox myCheckBox = (CheckBox)GridView1.Rows[i].FindControl("CheckBox1");
                if (myCheckBox.Checked) {
                    dataMessageId += GridView1.Rows[i].Cells[1].Text + ",";
                }
            }
            dataMessageId = dataMessageId.Trim(',');

            //1.連線資料庫
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["MessageBoardConnectionString"].ConnectionString);

            //2.宣告sql語法
            string sql = $"UPDATE messageBoard SET verify=0";
            string sql2 = $"UPDATE messageBoard SET verify=1 WHERE id IN ({dataMessageId})";

            //3.創建command物件
            SqlCommand command = new SqlCommand(sql, connection);
            SqlCommand command2 = new SqlCommand(sql2, connection);

            //4.資料庫連線開啟
            connection.Open();

            //5.執行sql
            command.ExecuteNonQuery();
            command2.ExecuteNonQuery();

            //6.資料庫關閉
            connection.Close();
        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            string dataMessageId = "";

            for (int i = 0; i < GridView2.Rows.Count; i++) {
                CheckBox myCheckBox = (CheckBox)GridView2.Rows[i].FindControl("CheckBox2");
                if (myCheckBox.Checked == true) {
                    dataMessageId += GridView2.Rows[i].Cells[1].Text + ",";
                }
            }
            dataMessageId = dataMessageId.Trim(',');

            //1.連線資料庫
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["MessageBoardConnectionString"].ConnectionString);

            //2.宣告sql語法
            string sql = $"UPDATE replyMessage SET verify=0";
            string sql2 = $"UPDATE replyMessage SET verify=1 WHERE id IN ({dataMessageId})";

            //3.創建command物件
            SqlCommand command = new SqlCommand(sql, connection);
            SqlCommand command2 = new SqlCommand(sql2, connection);

            //4.資料庫連線開啟
            connection.Open();

            //5.執行sql
            command.ExecuteNonQuery();
            command2.ExecuteNonQuery();

            //6.資料庫關閉
            connection.Close();
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            Response.Redirect("Message_Index.aspx");
        }
    }
}