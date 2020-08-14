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
    public partial class OgrenciEkran : Form
    {
        string sql_string = "Server = localhost; Port = 5432; Database = VTYSOdev; User Id = postgres; Password = 3210;"; // SIFRE

        public OgrenciEkran()
        {
            InitializeComponent();
        }

        private void OgrenciEkran_Load(object sender, EventArgs e)
        {
            tumDerslerCek();
            ogrenciDersCek();
            this.Text = "Öğrenci Bilgi Sistemi : " + Giris.kullanici_no;
        }

        private void tumDerslerCek()
        {
            NpgsqlConnection conn = new NpgsqlConnection(sql_string);

            string sql_cumlesi = "SELECT ders.id as \"Ders No\", ders.adi as \"Ders Adı\","
                + "sinif.adi as \"Sınıf Adı\", kisi.\"adiSoyadi\" as \"Hoca\" FROM dersler ders" 
                + " INNER JOIN akademisyenler aka ON aka.\"akademisyenNo\" = ders.\"akademisyenNo\"" 
                + " INNER JOIN kisiler kisi ON aka.\"kisiNo\" = kisi.\"id\""
                + " INNER JOIN siniflar sinif on sinif.\"sinifNo\" = ders.\"sinifNo\"";

            NpgsqlDataAdapter adap = new NpgsqlDataAdapter(sql_cumlesi, conn);

            DataSet data = new DataSet();
            conn.Open();

            adap.Fill(data, "dersler");
            data_tum_dersler.DataSource = data.Tables[0];

            conn.Close();
        }

        private void ogrenciDersCek()
        {
            NpgsqlConnection conn = new NpgsqlConnection(sql_string);

            string sql_cumlesi = "SELECT ders.id as \"Ders No\", ders.adi as \"Ders Adı\","
                + "sinif.adi as \"Sınıf Adı\", kisi.\"adiSoyadi\" as \"Hoca\","
                + " ogrders.\"ogrenciNotu\" as \"Alınan Not\" FROM \"ogrenciAlinanDers\" ogrders"
                + " INNER JOIN dersler ders ON ogrders.\"dersNo\" = ders.\"id\""
                + " INNER JOIN akademisyenler aka ON aka.\"akademisyenNo\" = ders.\"akademisyenNo\""
                + " INNER JOIN siniflar sinif on sinif.\"sinifNo\" = ders.\"sinifNo\""
                + " INNER JOIN kisiler kisi on kisi.\"id\" = aka.\"kisiNo\""
                + " WHERE ogrders.\"aktif\" = true";

            NpgsqlDataAdapter adap = new NpgsqlDataAdapter(sql_cumlesi, conn);

            DataSet data = new DataSet();
            conn.Open();

            adap.Fill(data, "dersler");
            data_aldigim_dersler.DataSource = data.Tables[0];

            conn.Close();
        }

        private void Btn_ders_al_Click(object sender, EventArgs e)
        {
            NpgsqlConnection conn = new NpgsqlConnection(sql_string);
            conn.Open();

            using (var cmd = new NpgsqlCommand("CALL dersal(\'" + Convert.ToInt32(Giris.kullanici_no) + "\', \'" + Convert.ToInt32(txt_ders_al_no.Text) + "\')", conn))
            {
                using (var reader = cmd.ExecuteReader())
                {
                    MessageBox.Show("Ders eklendi.");
                    ogrenciDersCek();
                }
            }
        }

        private void Btn_ders_birak_Click(object sender, EventArgs e)
        {
            NpgsqlConnection conn = new NpgsqlConnection(sql_string);
            conn.Open();

            using (var cmd = new NpgsqlCommand("CALL dersbirak(\'" + Convert.ToInt32(Giris.kullanici_no) + "\', \'" + Convert.ToInt32(txt_ders_birak_no.Text) + "\')", conn))
            {
                using (var reader = cmd.ExecuteReader())
                {
                    MessageBox.Show("Ders silindi.");
                    ogrenciDersCek();
                }
            }
        }
    }
}
