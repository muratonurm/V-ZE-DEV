using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Npgsql;

namespace VTYSOdev
{
    public partial class Giris : Form
    {
        public static string kullanici_no;

        public Giris()
        {
            InitializeComponent();
        }

        private void Btn_Ogrenci_Click(object sender, EventArgs e)
        {
            string sql_cumlesi = "Select * From ogrenciler where \"ogrenciNo\" = '" + txt_id.Text +"'";

            NpgsqlConnection conn = new NpgsqlConnection("Server = localhost; Port = 5432; Database = VTYSOdev; User Id = postgres; Password = 3210;"); // SIFRE
            NpgsqlDataAdapter adap = new NpgsqlDataAdapter(sql_cumlesi, conn);
            DataSet data = new DataSet();
            adap.Fill(data, "ogrenciler");
            conn.Open();

            OgrenciEkran ogrenciEkran = new OgrenciEkran();
            if (data.Tables[0].Rows.Count >= 1)
            {
                if (data.Tables[0].Rows[0][2].ToString() == txt_sifre.Text)
                {
                    kullanici_no = txt_id.Text;
                    ogrenciEkran.Show();
                }
                else
                {
                    MessageBox.Show("Numara veya şifre yanlış.");
                }
            } else
            {
                MessageBox.Show("Numara veya şifre yanlış.");
            }
        }

        private void Btn_Akademisyen_Click(object sender, EventArgs e)
        {
            string sql_cumlesi = "Select * From akademisyenler where \"akademisyenNo\" = '" + txt_id.Text + "'";

            NpgsqlConnection conn = new NpgsqlConnection("Server = localhost; Port = 5432; Database = VTYSOdev; User Id = postgres; Password = 3210;"); // SIFRE
            NpgsqlDataAdapter adap = new NpgsqlDataAdapter(sql_cumlesi, conn);
            DataSet data = new DataSet();
            adap.Fill(data, "akademisyenler");
            conn.Open();

            AkademisyenEkran AkademisyenEkran = new AkademisyenEkran();
            if (data.Tables[0].Rows.Count >= 1)
            {
                if (data.Tables[0].Rows[0][2].ToString() == txt_sifre.Text)
                {
                    kullanici_no = txt_id.Text;
                    AkademisyenEkran.Show();
                }
                else
                {
                    MessageBox.Show("Numara veya şifre yanlış.");
                }
            }
            else
            {
                MessageBox.Show("Numara veya şifre yanlış.");
            }
        }

        private void Btn_yonetici_Click(object sender, EventArgs e)
        {
            string sql_cumlesi = "Select * From personeller where \"personelNo\" = '" + txt_id.Text + "'";

            NpgsqlConnection conn = new NpgsqlConnection("Server = localhost; Port = 5432; Database = VTYSOdev; User Id = postgres; Password = 3210;"); // SIFRE
            NpgsqlDataAdapter adap = new NpgsqlDataAdapter(sql_cumlesi, conn);
            DataSet data = new DataSet();
            adap.Fill(data, "personeller");
            conn.Open();

            YoneticiEkran YoneticiEkran = new YoneticiEkran();
            if (data.Tables[0].Rows.Count >= 1)
            {
                if (data.Tables[0].Rows[0][2].ToString() == txt_sifre.Text)
                {
                    kullanici_no = txt_id.Text;
                    YoneticiEkran.Show();
                }
                else
                {
                    MessageBox.Show("Numara veya şifre yanlış.");
                }
            }
            else
            {
                MessageBox.Show("Numara veya şifre yanlış.");
            }
        }

        private void Giris_Load(object sender, EventArgs e)
        {

        }
    }
}
