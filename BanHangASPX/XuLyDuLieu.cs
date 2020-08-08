using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace BanHangASPX
{
    public class XuLyDuLieu
    {
        string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=F:\SourceVS2019\BanHangASPX\BanHangASPX\App_Data\QuanLyBanHang.mdf;Integrated Security=True";
        SqlConnection conn;

        public XuLyDuLieu()
        {
            conn = new SqlConnection(connectionString);
        }
        public void Open()
        {
            if (conn.State != ConnectionState.Open)
                conn.Open();
        }
        public void Close()
        {
            if (conn.State != ConnectionState.Closed)
                conn.Close();
        }
        public int excuteNonQuery(string sql)
        {
            SqlCommand comm = new SqlCommand(sql, conn);
            Open();
            int result = comm.ExecuteNonQuery();
            Close();
            return result;
        }
        public int excuteScalar(string sql)
        {
            SqlCommand comm = new SqlCommand(sql, conn);
            Open();
            int result = (int)comm.ExecuteScalar();
            Close();
            return result;
        }
        public DataTable readData(string query)
        {

            Open();
            DataTable dt = new DataTable();
            try
            {
                SqlCommand comm = new SqlCommand(query, conn);
                SqlDataAdapter data = new SqlDataAdapter(comm);
                data.Fill(dt);
            }
            catch (Exception)
            {
                dt = null;
            }
            Close();
            return dt;
        }
        public int updateDataStored(string query, string[] param, string[] values)
        {
            SqlCommand command = new SqlCommand(query, conn);
            Open();
            command.CommandType = CommandType.StoredProcedure;

            if (param != null)
                for (int i = 0; i < param.Length; i++)
                    command.Parameters.Add(new SqlParameter(param[i], values[i]));
            return command.ExecuteNonQuery();
        }
        public DataTable readDataStored(string query, string[] param, string[] values)
        {
            SqlCommand command = new SqlCommand(query, conn);
            command.CommandType = CommandType.StoredProcedure;
            if (param != null)
                for (int i = 0; i < param.Length; i++)
                    command.Parameters.Add(new SqlParameter(param[i], values[i]));
            DataTable dt = new DataTable();
            SqlDataAdapter data = new SqlDataAdapter(command);
            data.Fill(dt);
            return dt;
        }
        public string readOnlyStore(string query, string[] param, string[] values)
        {
            SqlCommand command = new SqlCommand(query, conn);
            Open();
            command.CommandType = CommandType.StoredProcedure;
            if (param != null)
                for (int i = 0; i < param.Length; i++)
                    command.Parameters.Add(new SqlParameter(param[i], values[i]));
            return command.ExecuteScalar()+"";
        }
    }
}