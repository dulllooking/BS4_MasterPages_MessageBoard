using System;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace messageBoard
{
    public partial class Manager_SignIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                Title = "登入後台管理系統";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //1.連線資料庫
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["MessageBoardConnectionString"].ConnectionString);

            //2.sql語法 (@參數化避免隱碼攻擊) reader判斷條件設在SQL在資料庫找不到直接報錯
            string sql = $"SELECT * FROM managerData WHERE account=@accpunt AND password=@password";

            //3.創建command物件
            SqlCommand command = new SqlCommand(sql, connection);

            //4.放入參數化資料
            command.Parameters.AddWithValue("@accpunt", TextBox1.Text);
            command.Parameters.AddWithValue("@password", TextBox2.Text);

            //5.資料庫連線開啟
            connection.Open();

            //6.執行sql
            SqlDataReader reader = command.ExecuteReader(); //指標指在BOF(表格之上)

            //讀出一筆資料寫入控制器 (.Read()一次會跑一筆)
            //.Read()=>指針往下一移並回傳bool，如果要讀全部可用while //最後一筆之後是EOF
            if (!reader.Read()) {
                //資料庫裡找不到相同資料時，表示帳號.密碼有誤!
                //可寫成 if (!dr.HasRows){}
                Label4.Text = "帳號or密碼錯誤!";
                Label4.Visible = true;
                connection.Close();

                //終止程式
                //Response.End(); //會清空頁面
                return;
            }
            else {
                Session["Login"] = "OK"; //帳密通過查核的Key
                Session["Power"] = reader["maxPower"].ToString(); //審核權力的Key
                connection.Close();
                if (Session["Power"].ToString().Equals("True")) {
                    Response.Redirect("ContentPageV_Manager_Verify.aspx"); //最高管理員-跳至管理員資格審核頁面
                }
                else {
                    Response.Redirect("ContentPageV_Manager_Message.aspx"); //一般管理員-跳至全部留言內容審核頁面
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("ContentPage_Message_Index.aspx");
        }
    }
}