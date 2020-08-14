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
    public partial class AkademisyenEkran : Form
    {
        string sql_string = "Server = localhost; Port = 5432; Database = VTYSOdev; User Id = postgres; Password = 3210;"; // SIFRE

        public AkademisyenEkran()
        {
            InitializeComponent();
        }

        private void AkademisyenEkran_Load(object sender, EventArgs e)
        {
            this.Text = "Akademisyen Bilgi Sistemi : " + Giris.kullanici_no;
            ogrencilerimiCek();
        }

        private void ogrencilerimiCek()
        {
            NpgsqlConnection conn = new NpgsqlConnection(sql_string);

            string sql_cumlesi = "SELECT ogrders.\"ogrenciNo\" as \"Öğrenci No\"," +
                " kisi.\"adiSoyadi\" as \"Adı Soyadı\", ders.\"adi\" as \"Ders Adı\"," +
                " ogrders.\"ogrenciNotu\" as \"Notu\" FROM \"ogrenciAlinanDers\" ogrders" +
                " INNER JOIN dersler ders ON ogrders.\"dersNo\" = ders.\"id\"" +
                " INNER JOIN akademisyenler aka ON aka.\"akademisyenNo\" = ders.\"akademisyenNo\"" +
                " INNER JOIN ogrenciler ogr ON ogrders.\"ogrenciNo\" = ogr.\"ogrenciNo\"" +
                " INNER JOIN kisiler kisi ON ogr.\"kisiNo\" = kisi.\"id\"" +
                " WHERE ogrders.\"aktif\" = true and ders.\"akademisyenNo\" = " + Convert.ToInt32(Giris.kullanici_no) + "";

            NpgsqlDataAdapter adap = new NpgsqlDataAdapter(sql_cumlesi, conn);

            DataSet data = new DataSet();
            conn.Open();

            adap.Fill(data, "ogrencilerim");
            data_dersler.DataSource = data.Tables[0];

            conn.Close();
        }

        private void Btn_not_ver_Click(object sender, EventArgs e)
        {
            NpgsqlConnection conn = new NpgsqlConnection(sql_string);
            conn.Open();

            using (var cmd = new NpgsqlCommand("CALL notgir(\'" + Convert.ToInt32(txt_ogrenci_no.Text) + "\', \'" + Convert.ToInt32(txt_not.Text) + "\')", conn))
            {
                using (var reader = cmd.ExecuteReader())
                {
                    MessageBox.Show("Not verildi.");
                }
            }
            ogrencilerimiCek();
        }

        private void Data_dersler_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
