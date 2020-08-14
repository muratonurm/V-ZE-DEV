namespace VTYSOdev
{
    partial class YoneticiEkran
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.btn_ogrenci_ekle = new System.Windows.Forms.Button();
            this.btn_akademisyen_ekle = new System.Windows.Forms.Button();
            this.btn_ogrenci_sil = new System.Windows.Forms.Button();
            this.btn_akademisyen_sil = new System.Windows.Forms.Button();
            this.btn_ders_ekle = new System.Windows.Forms.Button();
            this.btn_ders_sil = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // btn_ogrenci_ekle
            // 
            this.btn_ogrenci_ekle.Location = new System.Drawing.Point(12, 12);
            this.btn_ogrenci_ekle.Name = "btn_ogrenci_ekle";
            this.btn_ogrenci_ekle.Size = new System.Drawing.Size(122, 43);
            this.btn_ogrenci_ekle.TabIndex = 0;
            this.btn_ogrenci_ekle.Text = "Öğrenci Ekle";
            this.btn_ogrenci_ekle.UseVisualStyleBackColor = true;
            this.btn_ogrenci_ekle.Click += new System.EventHandler(this.Btn_ogrenci_ekle_Click);
            // 
            // btn_akademisyen_ekle
            // 
            this.btn_akademisyen_ekle.Location = new System.Drawing.Point(12, 61);
            this.btn_akademisyen_ekle.Name = "btn_akademisyen_ekle";
            this.btn_akademisyen_ekle.Size = new System.Drawing.Size(122, 43);
            this.btn_akademisyen_ekle.TabIndex = 1;
            this.btn_akademisyen_ekle.Text = "Akademisyen Ekle";
            this.btn_akademisyen_ekle.UseVisualStyleBackColor = true;
            this.btn_akademisyen_ekle.Click += new System.EventHandler(this.Btn_akademisyen_ekle_Click);
            // 
            // btn_ogrenci_sil
            // 
            this.btn_ogrenci_sil.Location = new System.Drawing.Point(141, 12);
            this.btn_ogrenci_sil.Name = "btn_ogrenci_sil";
            this.btn_ogrenci_sil.Size = new System.Drawing.Size(122, 43);
            this.btn_ogrenci_sil.TabIndex = 2;
            this.btn_ogrenci_sil.Text = "Öğrenci Sil";
            this.btn_ogrenci_sil.UseVisualStyleBackColor = true;
            this.btn_ogrenci_sil.Click += new System.EventHandler(this.Btn_ogrenci_sil_Click);
            // 
            // btn_akademisyen_sil
            // 
            this.btn_akademisyen_sil.Location = new System.Drawing.Point(140, 61);
            this.btn_akademisyen_sil.Name = "btn_akademisyen_sil";
            this.btn_akademisyen_sil.Size = new System.Drawing.Size(122, 43);
            this.btn_akademisyen_sil.TabIndex = 3;
            this.btn_akademisyen_sil.Text = "Akademisyen Sil";
            this.btn_akademisyen_sil.UseVisualStyleBackColor = true;
            this.btn_akademisyen_sil.Click += new System.EventHandler(this.Btn_akademisyen_sil_Click);
            // 
            // btn_ders_ekle
            // 
            this.btn_ders_ekle.Location = new System.Drawing.Point(12, 110);
            this.btn_ders_ekle.Name = "btn_ders_ekle";
            this.btn_ders_ekle.Size = new System.Drawing.Size(122, 43);
            this.btn_ders_ekle.TabIndex = 4;
            this.btn_ders_ekle.Text = "Ders Ekle";
            this.btn_ders_ekle.UseVisualStyleBackColor = true;
            this.btn_ders_ekle.Click += new System.EventHandler(this.Btn_ders_ekle_Click);
            // 
            // btn_ders_sil
            // 
            this.btn_ders_sil.Location = new System.Drawing.Point(140, 110);
            this.btn_ders_sil.Name = "btn_ders_sil";
            this.btn_ders_sil.Size = new System.Drawing.Size(122, 43);
            this.btn_ders_sil.TabIndex = 5;
            this.btn_ders_sil.Text = "Ders Sil";
            this.btn_ders_sil.UseVisualStyleBackColor = true;
            this.btn_ders_sil.Click += new System.EventHandler(this.Btn_ders_sil_Click);
            // 
            // YoneticiEkran
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(275, 163);
            this.Controls.Add(this.btn_ders_sil);
            this.Controls.Add(this.btn_ders_ekle);
            this.Controls.Add(this.btn_akademisyen_sil);
            this.Controls.Add(this.btn_ogrenci_sil);
            this.Controls.Add(this.btn_akademisyen_ekle);
            this.Controls.Add(this.btn_ogrenci_ekle);
            this.Name = "YoneticiEkran";
            this.Text = "Yonetici Sistemi";
            this.Load += new System.EventHandler(this.YoneticiEkran_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btn_ogrenci_ekle;
        private System.Windows.Forms.Button btn_akademisyen_ekle;
        private System.Windows.Forms.Button btn_ogrenci_sil;
        private System.Windows.Forms.Button btn_akademisyen_sil;
        private System.Windows.Forms.Button btn_ders_ekle;
        private System.Windows.Forms.Button btn_ders_sil;
    }
}