using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Microsoft.VisualBasic;
using Npgsql;
namespace VTYSOdev
{
    public partial class YoneticiEkran : Form
    {
        string sql_string = "Server = localhost; Port = 5432; Database = VTYSOdev; User Id = postgres; Password = 3210;"; // SIFRE

        public YoneticiEkran()
        {
            InitializeComponent();
        }

        private void Btn_ogrenci_ekle_Click(object sender, EventArgs e)
        {
            string adi_soyadi = Interaction.InputBox("Öğrencinin Adı Soyadı : ", "Öğrenci Ekle", "");
            string sifre = Interaction.InputBox("Öğrencinin Şifresi : ", "Öğrenci Ekle", "");
            string ulke_no = Interaction.InputBox("Öğrencinin Ulke No : ", "Öğrenci Ekle", "");
            string il_no = Interaction.InputBox("Öğrencinin İl No : ", "Öğrenci Ekle", "");
            string ilce_no = Interaction.InputBox("Öğrencinin İlçe No : ", "Öğrenci Ekle", "");
            string lisans_no = Interaction.InputBox("Öğrencinin Lisans Bölüm No : ", "Öğrenci Ekle", "");

            NpgsqlConnection conn = new NpgsqlConnection(sql_string);
            conn.Open();

            using (var cmd = new NpgsqlCommand("CALL ogrenciekle(\'"+ adi_soyadi + "\', \'"+ sifre + "\' , \'" + ulke_no + "\' , \'" + il_no + "\' , \'" + ilce_no + "\' , \'" + lisans_no + "\')", conn))
            {
                using (var reader = cmd.ExecuteReader()) {
                    MessageBox.Show("Öğrenci eklendi.");
                }
            }
        }

        private void Btn_akademisyen_ekle_Click(object sender, EventArgs e)
        {
            string adi_soyadi = Interaction.InputBox("Akademisyen Adı Soyadı : ", "Akademisyen Ekle", "");
            string sifre = Interaction.InputBox("Akademisyen Şifresi : ", "Akademisyen Ekle", "");
            string fakulte_kodu = Interaction.InputBox("Akademisyen Bağlı Olduğu Fakulte Kodu : ", "Akademisyen Ekle", "");
            string ulke_no = Interaction.InputBox("Akademisyen Ulke No : ", "Akademisyen Ekle", "");
            string il_no = Interaction.InputBox("Akademisyen İl No : ", "Akademisyen Ekle", "");
            string ilce_no = Interaction.InputBox("Akademisyen İlçe No : ", "Akademisyen Ekle", "");
            string lisans_no = Interaction.InputBox("Akademisyen Lisans Bölüm No : ", "Akademisyen Ekle", "");
            string master_no = Interaction.InputBox("Akademisyen Master Bölüm No : ", "Akademisyen Ekle", "");
            string doktora_no = Interaction.InputBox("Akademisyen Doktora Bölüm No : ", "Akademisyen Ekle", "");

            NpgsqlConnection conn = new NpgsqlConnection(sql_string);

            string sql_cumlesi = "Select * From fakulteler where \"fakulteKod\" = '" + fakulte_kodu + "'";
            NpgsqlDataAdapter adap = new NpgsqlDataAdapter(sql_cumlesi, conn);

            DataSet data = new DataSet();
            adap.Fill(data, "fakulteler");
            conn.Open();

            if (data.Tables[0].Rows.Count >= 1)
            {
                string fakulte_no = data.Tables[0].Rows[0][0].ToString();
                
                NpgsqlConnection conn_2 = new NpgsqlConnection(sql_string);
                conn_2.Open();

                using (var cmd = new NpgsqlCommand("CALL akademisyenekle(\'" + adi_soyadi + "\', \'" + sifre + "\', \'" + fakulte_no + "\', \'" + ulke_no + "\', \'" + il_no + "\', \'" + ilce_no + "\', \'" + lisans_no + "\', \'" + master_no + "\', \'" + doktora_no + "\')", conn_2))
                {
                    using (var reader = cmd.ExecuteReader())
                    {
                        MessageBox.Show("Akademisyen eklendi.");
                    }
                }

                conn_2.Close();
            }

            conn.Close();
        }

        private void Btn_ogrenci_sil_Click(object sender, EventArgs e)
        {
            string ogrenci_no = Interaction.InputBox("Öğrencinin Numarası : ", "Öğrenci Sil", "");

            NpgsqlConnection conn = new NpgsqlConnection(sql_string);
            conn.Open();

            using (var cmd = new NpgsqlCommand("CALL ogrencisil(\'" + ogrenci_no + "\')", conn))
            {
                using (var reader = cmd.ExecuteReader())
                {
                    MessageBox.Show("Öğrenci silindi.");
                } 
            }
        }

        private void Btn_akademisyen_sil_Click(object sender, EventArgs e)
        {
            string akademisyen_no = Interaction.InputBox("Akademisyen Numarası : ", "Akademisyen Sil", "");

            NpgsqlConnection conn = new NpgsqlConnection(sql_string);
            conn.Open();

            using (var cmd = new NpgsqlCommand("CALL akademisyensil(\'" + akademisyen_no + "\')", conn))
            {
                using (var reader = cmd.ExecuteReader())
                {
                    MessageBox.Show("Akademisyen silindi.");
                }
            }
        }

        private void Btn_ders_ekle_Click(object sender, EventArgs e)
        {
            string ders_adi = Interaction.InputBox("Dersin Adı : ", "Ders Ekle", "");
            string sinif_no = Interaction.InputBox("Sınıf Numarası : ", "Ders Ekle", "");
            string hoca_no = Interaction.InputBox("Hoca Numarası : ", "Ders Ekle", "");

            NpgsqlConnection conn = new NpgsqlConnection(sql_string);
            conn.Open();

            using (var cmd = new NpgsqlCommand("CALL dersekle(\'" + ders_adi + "\', \'" + sinif_no + "\', \'" + hoca_no + "\')", conn))
            {
                using (var reader = cmd.ExecuteReader())
                {
                    MessageBox.Show("Ders eklendi.");
                }
            }
        }

        private void Btn_ders_sil_Click(object sender, EventArgs e)
        {
            string ders_no = Interaction.InputBox("Dersin Numarası : ", "Ders Sil", "");

            NpgsqlConnection conn = new NpgsqlConnection(sql_string);
            conn.Open();

            using (var cmd = new NpgsqlCommand("CALL derssil(\'" + ders_no + "\')", conn))
            {
                using (var reader = cmd.ExecuteReader())
                {
                    MessageBox.Show("Ders silindi.");
                }
            }
        }

        private void YoneticiEkran_Load(object sender, EventArgs e)
        {
            this.Text = "Yönetici Bilgi Sistemi : " + Giris.kullanici_no;
        }
    }
}
