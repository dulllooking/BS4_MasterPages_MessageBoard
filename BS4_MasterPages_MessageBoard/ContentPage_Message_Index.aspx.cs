using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace BS4_MasterPages_MessageBoard
{
    public partial class ContentPage_Message_Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                showMessageBoard();
            }
        }

        private void showMessageBoard()
        {
            //1.連線資料庫
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["MessageBoardConnectionString"].ConnectionString);

            //2.建立判斷網址是否有傳值邏輯 (網址傳值功能已於製作控制項時已完成)
            //分頁用
            int page = 0;

            //判斷網址後有無參數
            //也可用String.IsNullOrWhiteSpace
            if (String.IsNullOrEmpty(Request.QueryString["page"])) {
                page = 1; //page後無值就是第一頁
            }
            else {
                page = Convert.ToInt32(Request.QueryString["page"]);
            }

            //3.設定頁面參數屬性
            //跟我們的控制項說一頁有幾筆
            WebUserControl1.limit = 8;
            //跟我們控制項說我們是哪一頁要有分頁
            WebUserControl1.targetpage = "ContentPage_Message_Index.aspx";

            //4.建立計算分頁顯示資料項邏輯 (每一頁是從第幾筆開始到第幾筆結束)
            //計算每個分頁的第幾筆到第幾筆
            var floor = (page - 1) * WebUserControl1.limit + 1;
            var ceiling = page * WebUserControl1.limit;

            //5.建立計算資料筆數的SQL語法
            //算出我們要秀的資料筆數的總數
            string sql_countTotal = "SELECT COUNT(*) FROM MessageBoard WHERE verify = 1";
            SqlCommand commandForTotal = new SqlCommand(sql_countTotal, connection);

            //6.將取得的資料筆數設定給頁面參數屬性
            connection.Open();
            int count = Convert.ToInt32(commandForTotal.ExecuteScalar()); //count不用全算
            connection.Close();

            //7. 將取得的資料筆數設定給頁面參數屬性
            //算出總數以後，把總數給我們的控制項
            WebUserControl1.totalitems = count;

            //8. 使用showPageControls()渲染至網頁 (方法於製作控制項時已完成)
            //渲染控制項出來(分頁頁碼),最後的步驟
            WebUserControl1.showPageControls();

            //9. 將原始拉取至GridView資料表的SQL語法使用CTE暫存表改寫，並使用ROW_NUMBER()函式製作GridView資料項流水號
            //SQL用CTE暫存表 + ROW_NUMBER 去生出我的流水號 (修改原本的SQL)
            string sql = $"WITH temp AS (SELECT ROW_NUMBER() OVER (ORDER BY initDate DESC) AS rowindex, (SELECT COUNT(title_id) FROM replyMessage WHERE title_id = messageBoard.id) AS reply, * FROM MessageBoard WHERE verify = 1) SELECT * FROM temp WHERE rowindex >= {floor} AND rowindex <= {ceiling}";
            SqlCommand command = new SqlCommand(sql, connection);

            //10. 使用SqlDataAdapter將SQL語法命令指定給適配器執行
            //把剛才CTE產生的資料塞進GridView
            SqlDataAdapter adapter = new SqlDataAdapter(command);

            //11. 建立空Table
            DataTable table = new DataTable();

            //12.將適配器取得內容填入Table
            adapter.Fill(table);

            //13.將Table資料綁定給GridView
            GridView1.DataSource = table;
            GridView1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("ContentPage_Message_Add.aspx");
        }
    }
}