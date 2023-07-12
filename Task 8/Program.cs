using System;
using MySql.Data;
using MySql.Data.MySqlClient;
class Program
{
    public static void Main(string[] a)
    {
        string strcon = @"server=localhost;userid=root@localhost;password=root;database=myshop";
        using var con = new MySqlConnection(strcon);
        con.Open();
        using var cmd = new MySqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "insert into table1 values (2,'Mohit')";
        cmd.ExecuteNonQuery();
        Console.WriteLine("Record Inserted");
    }
}