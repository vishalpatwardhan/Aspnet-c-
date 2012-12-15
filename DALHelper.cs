using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Data;
using System.Configuration;
namespace DataAccess
{
    public class DALHelper
    {
        #region datamembers

        private MySqlConnection objConn = new MySqlConnection();
        private MySqlCommand objComm = new MySqlCommand();
        private DataSet ds = new DataSet();
        private MySqlDataAdapter da;
        private MySqlDataReader dr;
        private DataTable dt = new DataTable();
        public string sqlQuery { get; set; }
        private string connStr;

        #endregion

        #region memberfunctions
        public string GetConnectionString()
        {
            connStr = String.Format("server={0};user id={1}; password={2};database=dbinvoice; pooling=false", "localhost", "root", "test");

            return connStr;
        }
        public void OpenConnection()
        {
            objConn.ConnectionString = GetConnectionString();
            objConn.Open();
        }

        public void CloseConnection()
        {
            objConn.Close();
        }

        public DataTable GetDataTable(string sqlquery)
        {
            objComm.CommandText = sqlquery;
            objComm.Connection = objConn;
            OpenConnection();
            try
            {
                dr = objComm.ExecuteReader();

                if (dr != null)
                {
                    dt.Load(dr);
                }
                CloseConnection();
            }
            catch (Exception ex)
            {

            }
            return dt;

        }

        public DataTable GetDataTable(string sqlquery, string param1)
        {
            objComm.CommandText = sqlquery;
            objComm.Connection = objConn;
            objComm.Parameters.Add("UNAME", MySqlDbType.VarChar).Value = param1;
            objComm.CommandType = CommandType.StoredProcedure;
            OpenConnection();
            try
            {
                dr = objComm.ExecuteReader();
                dt.Load(dr);
                CloseConnection();
            }
            catch (Exception ex)
            {

            }

            return dt;
        }

        public void ExecuteQuery(string sqlquery)
        {

            objComm.CommandText = sqlquery;
            objComm.Connection = objConn;
            try
            {
                OpenConnection();
                objComm.ExecuteNonQuery();
                CloseConnection();
            }
            catch (Exception ex)
            {

            }

        }


        #endregion

    }
}